#!/bin/sh
# Anyka Camera SD Card Payload
# Place this in /ak_wifi_test_ap/setup.sh on SD card

JFFS2="/etc/jffs2"

# Enable telnet
telnetd &

# Add root user (change username/hash as needed)
# To generate hash: openssl passwd -1 -salt abc12345 yourpassword
if ! grep -q "^camera:" $JFFS2/passwd; then
    echo "" >> $JFFS2/passwd
    echo "camera:x:0:0:camera:/root:/bin/sh" >> $JFFS2/passwd
    echo "" >> $JFFS2/shadow
    echo "camera:\$1\$abc12345\$TKkpfLnkLCm3Ba3BrjQfZ.:0:0:99999:7:::" >> $JFFS2/shadow
fi
