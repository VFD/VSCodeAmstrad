<#
    .SYNOPSIS
        Start build sequence for Amstrad CPC project.
    .DESCRIPTION
        
    .PARAMETER  <Parameter-Name>
        Current full project directory: %1
        Current project directory Name: %2
        Curent folder file:             %3 
        Curent file:                    %4
        Curent file with no extention:  %5
        Curent file extention:          %6

#>

# $env:nom_variable = "valeur"

# ------------------------------------------------------------
# 6 parameters needed
# ------------------------------------------------------------
param(
    [Parameter(Mandatory=$true)]
    $CurrentFullProjectDirectory,
    [Parameter(Mandatory=$true)]
    $CurrentProjectDirectoryName,
    [Parameter(Mandatory=$true)]
    $CurentFolderFile,
    [Parameter(Mandatory=$true)]
    $CurentFile,
    [Parameter(Mandatory=$true)]
    $CurentFileNoExtention,
    [Parameter(Mandatory=$true)]
    $CurentFileExtention
)

# ------------------------------------------------------------
# Show information
# ------------------------------------------------------------
Write-Host
Write-Host "Start process:                 " $MyInvocation.MyCommand.Name -ForegroundColor green
Write-Host "Current full project directory: $CurrentFullProjectDirectory"
Write-Host "Current project directory Name: $CurrentProjectDirectoryName"
Write-Host "Curent folder file:             $CurentFolderFile"
Write-Host "Curent file:                    $CurentFile"
Write-Host "Curent file with no extention:  $CurentFileNoExtention"
Write-Host "Curent file extention:          $CurentFileExtention"

# ------------------------------------------------------------
# Set what we need, dot sourced
# ------------------------------------------------------------
. ./ps1/Set-cpcVars.ps1
Write-Host

# ------------------------------------------------------------
# Function END
# ------------------------------------------------------------
function Exit-cpcBuild {
    # Exit with the specified exit code
    Write-Host
    Write-Host "Exit with code : $env:ERRORCODE"
    exit $env:ERRORCODE
}

#$Cp32Path="$env:CAP32Folder/$env:CAP32"
#Write-Host " The file for Cap32 $Cp32Path"

# ------------------------------------------------------------
# Test if the DSK is present, if not create it
# ------------------------------------------------------------
if(![System.IO.File]::Exists("./$CurentFolderFile/dsk/$CurentFolderFile.dsk")){
    Write-Host
    Write-Host "        The file ./$CurentFolderFile/dsk/$CurentFolderFile.dsk not found" -ForegroundColor red
    Write-Host
    . ./ps1/New-cpcDSK.ps1 $CurentFolderFile $CurentFolderFile
}


# ------------------------------------------------------------
# if ASM
# ------------------------------------------------------------
# to do



# ------------------------------------------------------------
# Add to DSK
# ------------------------------------------------------------
# extention ?
switch($CurentFileExtention)
{
    ".asm" {$CurentFileExtentionToAdd = "bin"; Break}
    ".bas" {$CurentFileExtentionToAdd = $CurentFileExtention; Break}
}

Write-Host . ./ps1/Add-cpcFile2DSK.ps1 $CurentFolderFile $CurentFileNoExtention $CurentFileExtentionToAdd



Exit-cpcBuild

# ------------------------------------------------------------
# Check if any parameters are missing
# ------------------------------------------------------------
if (-not $param1 -or -not $param2 -or -not $param3 -or -not $param4 -or -not $param5 -or -not $param6) {
    Write-Host
    Write-Host "Not all 6 parameters were provided." -ForegroundColor Red
    Write-Host "Please provide all 6 parameters."
    # Set exit code to 1 (failure)
    $env:ERRORCODE=1
    # Call the END function
    Exit-cpcBuild
} else {
    # If the script gets here, then all 6 parameters were provided
    Write-Host
    Write-Host "All 6 parameters were provided."
}

# -----[EOF]--------------------------------------------------