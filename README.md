# anyka-camera-root
Explanation of how to get root access and activate telnet on anyka camera's


# Anyka Camera SD Card Payload

This repository contains an SD-card payload for certain Anyka-based cameras.

---

## How It Works

Some Anyka firmware checks the SD card during boot for a specific folder named:

ak_wifi_test_ap

If the folder exists **and** contains the required files, the camera will automatically copy and execute `setup.sh`.

The script:

- Starts the telnet service (`telnetd`)
- Ensures a root-level user named `camera` exists
- Modifies `/etc/jffs2/passwd` and `/etc/jffs2/shadow` if necessary

The three additional empty files are required because the firmware expects them to exist before executing the script.

---

## Setup Instructions

1. Download the folder `ak_wifi_test_ap` from this repository.
2. Format your SD card as **FAT32**.
3. Copy the entire `ak_wifi_test_ap` folder to the **root** of the SD card.

Your SD card should look exactly like this:

SD card root/
└── ak_wifi_test_ap/
    ├── setup.sh
    ├── hostapd        (empty file)
    ├── hostapd.conf   (empty file)
    └── udhcpd.conf    (empty file)

⚠️ The three empty files are mandatory. Do not remove them.

---

## Running the Payload

1. Insert the SD card into the camera.
2. Power on the camera.
3. Wait approximately 60 seconds.
4. Remove the SD card and hard reboot the camera
5. Telnet into the camera using:
   - Username: `camera`
   - Password: `system`

---

## Disclaimer

For educational and authorized device administration use only.

You are responsible for complying with applicable laws and ensuring you have permission to modify the hardware.
