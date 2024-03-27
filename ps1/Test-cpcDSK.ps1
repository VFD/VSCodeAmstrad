<#
    .SYNOPSIS
    Launch emulator with the associate DSK file.

    .DESCRIPTION
    This script is associate with the launch.json file.
    Technicaly it's for debug.
    But the task consist to launch this script and ask you which emulator you wnat to lauch.
    Providing the folder name open in VSCode.

    .PARAMETER  $dskFile
    Current project directory Name.
    
    .EXAMPLE
    . ./ps1/Test-cpcDSK.ps1 Hello

    Search the disk Hello.dsk in folder ./Hello/dsk
    If found ask for wich emulator you want to start

#>

# ------------------------------------------------------------
#  parameters needed
# ------------------------------------------------------------
param (
    [Parameter(Mandatory=$true)]
    $dskFile
)

# ------------------------------------------------------------
#  Start
# ------------------------------------------------------------
Write-Host
Write-Host Start PS1 to test DSK
Write-Host
Write-Host file : $dskFile
Write-Host

# ------------------------------------------------------------
#  Check DSK
# ------------------------------------------------------------



# ------------------------------------------------------------
#  Make choice
# ------------------------------------------------------------
$userInput=""
$validInput = $false
while (-not $validInput) {
    Write-Host "Please choose an option (type number or Cancel):" -ForegroundColor Yellow
    Write-Host
    Write-Host "    1. Amspirit" -ForegroundColor DarkGreen
    Write-Host "    2. Caprice32" -ForegroundColor DarkGreen
    Write-Host "    3. Caprice Forever" -ForegroundColor DarkGreen
    Write-Host "    4. CrocoDS" -ForegroundColor DarkGreen
    Write-Host
    Write-Host "    C for Cancel" -ForegroundColor Red
    Write-Host

    $userInput = (Read-Host "Your choice: ").ToLower()

    switch ($userInput) {
        "1" {
            Write-Host "You have choose Amspirit"
            #Start-Process "A.exe"
            $validInput = $true
        }
        "2" {
            Write-Host "You have choose Caprice32"
            #Start-Process "B.exe"
            $validInput = $true
        }
        "3" {
            Write-Host "You have choose Caprice Forever"
            #Start-Process "C.exe"
            $validInput = $true
        }
        "4" {
            Write-Host "You have choose CrocoDS"
            #Start-Process "D.exe"
            $validInput = $true
        }
        "c" {
            Write-Host "Quitting"
            $validInput = $true
        }
        default {
            Write-Host "Invalid input, please try again."
        }
    }
}


Write-Host
Write-Host "End test program."

# -----[EOF]--------------------------------------------------