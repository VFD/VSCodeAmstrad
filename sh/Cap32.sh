#!/bin/bash
# ============================================================
# Script:  cap32.sh
# Comment: start emulator
# ============================================================

# ------------------------------------------------------------
# Define what we need
# ------------------------------------------------------------
Caprice="Caprice64.exe"
CapriceFolder="CapriceForever"

# ------------------------------------------------------------
# Check if AMSpiriT is available
# ------------------------------------------------------------
if [ -f "$CapriceFolder/$Caprice" ]; then
    echo
    echo "$Caprice located in $CapriceFolder"
    echo
else
    echo
    echo "$Caprice not found in $CapriceFolder"
    echo "Check your directories."
    echo
    exit 1
fi

# ------------------------------------------------------------
# Check Arguments
# ------------------------------------------------------------
if [ $# -lt 2 ]; then
    echo "Arguments are not present, aborting."
    exit 1
fi

# ------------------------------------------------------------
# Launch emulator
# ------------------------------------------------------------
"$CapriceFolder/$Caprice" /DriveA=$1 /Command="run\"$2\""
