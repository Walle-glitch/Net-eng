# How to Use bridge_wireshark.sh

## Overview

The `bridge_wireshark.sh` script allows you to create a transparent network bridge between two Ethernet interfaces and capture network traffic using Wireshark. The bridge operates as a passive "tap," meaning the clients on both sides will not be aware of the bridge. Wireshark is used to analyze the traffic, and the bridge is automatically removed once Wireshark is closed.

## Requirements

Before running the script, ensure that you have the following tools installed:
- **iproute2**: For managing network interfaces.
- **bridge-utils** (optional): Used if you want to manage bridges with `brctl`.
- **Wireshark**: For traffic capture and analysis.

If you don't have these tools installed, you can install them using the provided `requirements.sh` script or manually by running:

```bash
sudo apt update -y
sudo apt install -y iproute2 bridge-utils wireshark
```

## How to Run the Script
1. Make the script executable:

Before running the script, make sure it's executable by using the following command:

```bash
chmod +x bridge_wireshark.sh
```
2. Run the script with sudo:

Run the script as root (or using sudo):

```bash
sudo ./bridge_wireshark.sh
```
3. Follow the prompts:

The script will display all available Ethernet interfaces (excluding wireless and virtual ones) and ask you to select two interfaces for bridging.

Example:

```bash
Available network interfaces:
eth0
eth1
eth2

Enter the first interface to bridge: eth0
Enter the second interface to bridge: eth1
```
4. Wireshark will automatically launch:

After creating the bridge, the script will automatically launch Wireshark to capture traffic flowing between the two interfaces. Wireshark will run in the background, allowing you to start capturing packets.

5. Closing Wireshark:

When you are done analyzing the traffic, simply close Wireshark. The script will detect that Wireshark has been closed and automatically remove the bridge between the interfaces.

6. Bridge Removal:

Once Wireshark is closed, the script will clean up by bringing down the bridge and restoring the original interface settings. You will see a message indicating that the bridge has been removed.

Example:
```bash
Wireshark closed. Removing the bridge...
Bridge removed. Exiting.
```

### Example Use Case
This script is useful for network engineers and security analysts who need to passively monitor traffic between two devices without altering the network configuration. By acting as a transparent bridge, it allows you to capture packets without affecting the data flow or notifying the connected devices of any network changes.

You can use this setup to:

* Analyze traffic between routers and switches.
* Capture packet flows between two network devices in a test environment.
* Debug network issues by inspecting the traffic at a specific point in the network.

### Troubleshooting
* Permission issues: If you see permission errors, make sure you are running the script as root or using sudo.
* Interfaces not listed: Ensure that the interfaces you wish to use are physical Ethernet interfaces (not wireless or virtual). You can verify your interface names using the ip link show command.

### Known Limitations
* This script currently supports bridging only two Ethernet interfaces. If you need to bridge more than two interfaces or require advanced configurations, you may need to modify the script or set up bridges manually.
* Wireshark must be installed and configured properly to capture traffic. Ensure you have appropriate permissions to run Wireshark as a non-root user, if necessary.

### Closing Remarks
This script simplifies the process of setting up a transparent bridge and capturing network traffic using Wireshark. It is a great tool for performing network diagnostics or security analyses in real-time.

If you encounter any issues or have suggestions for improvement, feel free to contribute or open an issue in the repository.

