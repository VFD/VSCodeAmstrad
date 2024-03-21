# ============================================================
# Script:  cap32.ps1
# Comment: start emulator
# ============================================================

# ------------------------------------------------------------
# Define what we need
# ------------------------------------------------------------
$Caprice = "Caprice64.exe"
$CapriceFolder = "CapriceForever"

# ------------------------------------------------------------
# Check if AMSpiriT is available
# ------------------------------------------------------------
if (Test-Path -Path "$CapriceFolder\$Caprice") {
    Write-Host "`n$Caprice located in $CapriceFolder`n"
} else {
    Write-Host "`n$Caprice not found in $CapriceFolder`nCheck your directories.`n"
    return
}

# ------------------------------------------------------------
# Check Arguments
# ------------------------------------------------------------
if ($args.Length -lt 2) {
    Write-Host "Arguments are not present, aborting."
    return
}

# ------------------------------------------------------------
# Launch emulator
# ------------------------------------------------------------
& "$CapriceFolder\$Caprice" /DriveA=$args[0] /Command="run`"$args[1]`""
