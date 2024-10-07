# Net-Eng

## A Collection of Scripts for Network Engineers

Welcome to **Net-Eng**! This repository is dedicated to gathering script solutions that are useful for network engineers. Here, you will find scripts covering a variety of tasks, from creating network bridges to monitoring and analyzing network traffic. The goal is to provide tools to streamline network-related tasks.

### Contents

- [bridge_wireshark.sh](bridge_wireshark.sh): A script to create a transparent network bridge and launch Wireshark to analyze traffic without affecting clients. The bridge is removed automatically when Wireshark is closed.
- More scripts will be added regularly.

### Requirements

To use the scripts in this repository, make sure you have the following tools installed:

- **iproute2**: Manages network interfaces.
- **bridge-utils** (optional): Used if you want to manage bridges with `brctl`.
- **Wireshark**: For capturing and analyzing network traffic.

To automatically install these tools, you can run our installation script [requirements.sh](requirements.sh).

### Installing Required Tools

1. Run the following command to install all necessary packages:

    ```bash
    sudo ./requirements.sh
    ```

2. If you want to allow non-root users to run Wireshark, follow the prompts in the installation script.

### How to Use the Scripts

1. Clone this repository:
   
    ```bash
    git clone https://github.com/your-username/Net-Eng.git
    ```

2. Navigate to the folder with the specific scripts and run them with root privileges:
   
    ```bash
    cd Net-Eng
    sudo ./bridge_wireshark.sh
    ```

### Planned Features

- Scripts for network monitoring
- Automation of VLAN configuration
- Tools for troubleshooting network issues

### Contributing

All contributions to this repository are welcome! If you have a script that you think could be useful for other network engineers, feel free to create a pull request or open an issue for discussion.

### License

This project is licensed under the MIT License – see [LICENSE](LICENSE) for more details.
