<#
    .SYNOPSIS
        Create all vars needed.

    .DESCRIPTION
        This script create Env vars needed for building the Amstrad project.
        You need to change them if you not use the directories inside the project.
        This vars no longer exist at the end of the session.

    .PARAMETER  <Parameter-Name>
        None.

    .INPUTS
        None.

    .OUTPUTS
        None.

    .EXAMPLE
        Call the script:
        .\Set-Vars

    .LINK
        None.
    
    .NOTE
        Author: VFD
#>


$env:VAR1 = "valeur1"
$env:VAR2 = "valeur2"



# ------------------------------------------------------------
# Define what we need
# ------------------------------------------------------------

Write-Host
Write-Host "Start define ENV Vars"

# ERROR Code
$env:ERRORCODE=0

# Caprice32
$env:CAP32=cap32.exe
$env:CAP32Folder=cap32

# Caprice Forever
$env:CapriceForever=Caprice64.exe
$env:CapriceForever=CapForever

# AMSpiriT
$env:Amspirit=Amspirit.exe
$env:AmspiritFolder=Amspirit

# ManageDSK
$env:ManageDSK=ManageDSK.exe
$env:ManageDSKFolder=ManageDSK

# ------------------------------------------------------------
# END
# ------------------------------------------------------------
Write-Host
Write-Host "ENV Vars defined"
# -----[EOF]--------------------------------------------------