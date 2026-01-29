#!/bin/bash
echo "check EUFI mode or BIOS mode"
if [ -d /sys/firmware/efi ]; then
    echo "System is booted in UEFI mode"
else
    echo "System is booted in BIOS mode"
fi
