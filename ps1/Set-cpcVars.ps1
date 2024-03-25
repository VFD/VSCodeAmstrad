<#
    .SYNOPSIS
        Create all vars needed for the build of the AMSTRAD project.

    .DESCRIPTION
        This script create Env vars needed for building the Amstrad project.
        You need to change them if you not use the directories inside the project.
        This vars no longer exist at the end of the session.
        At the end of the process, all gone.

    .EXAMPLE
        Call the script, dot sourced to keep vars.
        . .\Set-Vars

#>


# ------------------------------------------------------------
# Show information
# ------------------------------------------------------------
Write-Host
Write-Host "Starting: " $MyInvocation.MyCommand.Name -ForegroundColor green


# ------------------------------------------------------------
# Define what we need
# ------------------------------------------------------------

# ERROR Code
$env:ERRORCODE = 0

# Caprice32
$env:CAP32 = "cap32.exe"
$env:CAP32Folder = "cap32"

# Caprice Forever
$env:CapriceForever = "Caprice64.exe"
$env:CapriceForever = "CapForever"

# AMSpiriT
$env:Amspirit = "Amspirit.exe"
$env:AmspiritFolder = "Amspirit"

# ManageDSK
$env:ManageDSK = "ManageDSK.exe"
$env:ManageDSKFolder = "ManageDSK"

# ------------------------------------------------------------
# END
# ------------------------------------------------------------
Write-Host
Write-Host "Ending: " $MyInvocation.MyCommand.Name -ForegroundColor green
# -----[EOF]--------------------------------------------------