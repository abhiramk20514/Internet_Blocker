# NetBlocker 🔒

A simple bash-based tool to **scan your network and block internet access** for selected devices using **Bettercap**.

---

## 🚀 Features
- Scans devices on your local network
- Displays IP addresses and device names (when available)
- Allows user to block internet for a chosen target IP
- Uses ARP and DNS spoofing to block connections
- Attempts to restore ARP tables automatically on exit (Ctrl+C)

---

## ⚙️ Requirements

This script requires the following system packages to be installed:

```bash
sudo apt update
sudo apt install bettercap iproute2 arping grep awk -y
chmod +x netblocker.sh
sudo ./netblocker.sh

````
## Disclaimer

**Important — Read Carefully**

This software is provided **for educational, research, and authorized penetration-testing purposes only**. Do **not** use this tool on networks, systems, or devices for which you do not have explicit permission from the owner. Unauthorized use of this software may be illegal and could result in civil and/or criminal penalties.

By using this software you acknowledge and agree to the following:

1. You are solely responsible for ensuring you have the legal right and explicit permission to use this software against any target systems.
2. The author, **K. Sai Abhiram** (kollurusaiabhiram2005@gmail.com), contributors, and distributors of this software **accept no responsibility** and **assume no liability** for any misuse, damage, loss of data, loss of revenue, legal claims, or other consequences that arise from the use, modification, or distribution of this software.
3. You will comply with all applicable laws, regulations, and policies when using this software.
4. If you are unsure whether you have permission to test a given system or network, do not proceed.
5. Use this software only in controlled environments or with documented authorization from the network owner.

If you agree with the above, proceed responsibly and ethically.

MIT License

Copyright (c) 2025 K. Sai Abhiram

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
