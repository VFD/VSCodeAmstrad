<#
    .SYNOPSIS
        Rename the dsk project to CPC Power convention.

    .DESCRIPTION
        CPC Power web site:
        https://www.cpc-power.com/

    .PARAMETER  $dskFileToRename
        DSK file from the current project

    .EXAMPLE
        . ./ps1/Rename-cpcDSK2cpcpower.ps1 ...


#>

# ------------------------------------------------------------
#  parameters needed
# ------------------------------------------------------------
param (
    [Parameter(Mandatory=$true)]
    $dskFileToRename
)


# if (Test-Path variable:global:dskFileFolderToCreate)

# ------------------------------------------------------------
#  build new name with CPC Power convention
# ------------------------------------------------------------
$theYear = (Get-Date).Year



$dskFileNewName = " (F) ($theYear).dsk"

Write-Host Copy-Item -Path "$dskFileToRename" -Destination "$dskFileNewName"


# ------------------------------------------------------------
# End
# ------------------------------------------------------------
Write-Host
Write-Host "Ending: " $MyInvocation.MyCommand.Name


# -----[EOF]--------------------------------------------------