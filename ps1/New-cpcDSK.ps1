<#
    .SYNOPSIS
        Create a new dsk file in the dsk folder of the project.

    .DESCRIPTION
        This script create a dsk file with the parmaters.
        It's member of all the scripts for AMSTRAD projects.

    .PARAMETER  $dskFileFolderToCreate
        The folder where to create the dsk file.

    .PARAMETER  $dskFileToCreate
        The name of the file without extention. The extention is always "dsk".

    .EXAMPLE
        . ./ps1/New-cpcDSK Hello Hello

        Create the file Hello.dsk in the folder ./hello/dsk.
        Result ./Hello/dsk/Hello.dsk.
    
#>

# ------------------------------------------------------------
#  parameters needed
# ------------------------------------------------------------
param (
    [Parameter(Mandatory=$true)]
    $dskFileFolderToCreate,
    [Parameter(Mandatory=$true)]
    $dskFileToCreate
)

# ------------------------------------------------------------
# Show information
# ------------------------------------------------------------
Write-Host
Write-Host "Starting: " $MyInvocation.MyCommand.Name -ForegroundColor green
Write-Host "Try to Build  $dskFileToCreate.dsk in $dskFileFolderToCreate/dsk."

# ------------------------------------------------------------
# Test if the folder is present, if not create it
# ------------------------------------------------------------
if(![System.IO.Directory]::Exists("$dskFileFolderToCreate/dsk")){
    Write-Host
    Write-Host "The folder $dskFileFolderToCreate/dsk does'nt exist." -ForegroundColor red
    Write-Host "Creating folder $dskFileFolderToCreate/dsk."
    New-Item -ItemType Directory -Path "$dskFileFolderToCreate/dsk"
}

# ------------------------------------------------------------
# Create the dsk file with ManageDSK
# ------------------------------------------------------------
$ArgsListe = "-C -S$dskFileFolderToCreate\dsk\$dskFileToCreate.dsk"

Write-Host "Start process: $env:ManageDSKFolder $env:ManageDSK $ArgsListe"

# start the process and wait until it ends
Start-Process -FilePath "$env:ManageDSKFolder/$env:ManageDSK" -ArgumentList "$ArgsListe" -Wait

# ------------------------------------------------------------
# Check if creation is true
# ------------------------------------------------------------
if(![System.IO.File]::Exists("./$dskFileFolderToCreate/dsk/$dskFileToCreate.dsk")){
    Write-Host
    Write-Host "        The file ./$dskFileFolderToCreate/dsk/$dskFileToCreate.dsk not created" -ForegroundColor red
    Write-Host "        Unknown error." -ForegroundColor red
    Write-Host
    # Set exit code to 1 (failure)
    $env:ERRORCODE=1
    # Call the END function
} else {
    Write-Host
    Write-Host "        The file ./$dskFileFolderToCreate/dsk/$dskFileToCreate.dsk is created" -ForegroundColor green
}

# ------------------------------------------------------------
# End
# ------------------------------------------------------------
Write-Host
Write-Host "Ending: " $MyInvocation.MyCommand.Name

Exit-cpcBuild
# -----[EOF]--------------------------------------------------