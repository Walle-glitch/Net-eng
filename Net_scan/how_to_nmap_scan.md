# How to Use nmap_scan.sh

## Overview

The `nmap_scan.sh` script is a simple and effective tool for performing various types of network scans using Nmap. This script allows you to conduct ping scans, full port scans, service version detection, and even operating system detection on a target IP or domain.

## Requirements

Before running the script, ensure you have the following installed:
- **Nmap**: The network scanner tool used for the scans. You can install it with the following command if it’s not already installed:

```bash
sudo apt update -y
sudo apt install -y nmap
```

## How to Run the Script
1. Make the script executable:

Before running the script, make sure it's executable by using the following command:

```bash
chmod +x nmap_scan.sh
```
2. Run the script with sudo:

Since certain Nmap scans require root permissions, execute the script using sudo:

```bash
sudo ./nmap_scan.sh
```

3. Follow the prompts:

The script will prompt you to enter a target IP address or domain. Then, it will ask you to choose the type of scan you want to perform from the following options:

- **Ping scan (Host discovery)**: Checks whether the target host is up by sending ICMP echo requests.
- **Full port scan**: Scans all 65,535 TCP ports to discover which services are listening.
- **Service version detection**: Identifies the software versions of services running on open ports.
- **OS detection**: Attempts to determine the target’s operating system.
- **Comprehensive scan**: Performs all of the above scans in a single operation.

4. Scan results:

The scan results will be displayed in the terminal, providing detailed information about open ports, services, software versions, and operating systems based on the type of scan selected.

## Example Use Case
Scenario 1: Host Discovery (Ping Scan)
To quickly check whether a host is up, you can use the ping scan option:

Run the script:
bash
Copy code
sudo ./nmap_scan.sh
Enter the target (e.g., 192.168.1.1).
Select option 1 for Ping Scan.
Nmap will send ping requests to the target and inform you whether the host is reachable.
Scenario 2: Full Port Scan
If you need to discover which ports are open on a specific device, you can run a full port scan:

Run the script and enter the target (e.g., scanme.nmap.org).
Select option 2 for Full Port Scan.
The script will scan all 65,535 TCP ports, and the results will show which ports are open and available on the target.
Scenario 3: Service Version Detection
When troubleshooting a network or assessing security, you may want to identify which services and their versions are running:

Enter the target (e.g., 10.0.0.1).
Select option 3 for Service Version Detection.
The script will display the open ports and detect which services (e.g., HTTP, SSH) and their versions are running on those ports.
Scenario 4: OS Detection
To gather more information about a device's operating system, select the OS detection scan:

Provide the target (e.g., 192.168.0.100).
Select option 4 for OS Detection.
Nmap will attempt to determine the operating system running on the target by analyzing network traffic characteristics.
Scenario 5: Comprehensive Scan
For a thorough analysis, use the comprehensive scan:

Run the script and select option 5.
The comprehensive scan will run all types of scans (ping, port scan, service detection, and OS detection) in one go.
Troubleshooting
Permission Denied: If you see permission errors, ensure you are running the script with sudo or as root, as certain scan types require elevated permissions.
No Results: If you do not see expected results, the target host may have firewalls or packet filters blocking certain scan types. In such cases, you can try different Nmap options (e.g., -Pn to skip ping checks).
Known Limitations
Root Privileges: Some advanced Nmap features, such as OS detection, require root privileges. Be sure to run the script using sudo to unlock full functionality.
Scan Duration: Comprehensive scans, especially those that scan all ports, can take a long time depending on the target's size, distance, and network performance.
Closing Remarks
The nmap_scan.sh script simplifies the process of running various types of Nmap scans, making it easy to assess network hosts and services. It's a handy tool for network engineers, administrators, and security professionals.

For suggestions, improvements, or issues, feel free to contribute or open an issue in the repository.
