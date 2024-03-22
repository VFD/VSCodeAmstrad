<#
    .SYNOPSIS
        
    .DESCRIPTION
        
    .PARAMETER  <Parameter-Name>
        
    .INPUTS
        
    .OUTPUTS
        
    .EXAMPLE
        
    .LINK
        
    .NOTE
        Author: VFD
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

Write-Host
Write-Host "IN: " $MyInvocation.MyCommand.Name
Write-Host "Try to Build DSK $dskFileFolderToCreate $dskFileToCreate"

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
# Create with ManageDSK
# ------------------------------------------------------------

#./$env:ManageDSKFolder/$env:ManageDSK -C -S$dskFileFolderToCreate\dsk\$dskFileToCreate.dsk
#start-process -FilePath $NomExe -ArgumentList $MesVariables -workingdirectory $WorkingDir

$ArgsListe = "-C -S$dskFileFolderToCreate\dsk\$dskFileToCreate.dsk"

Write-Host $ArgsListe

Start-Process -WorkingDirectory $env:ManageDSKFolder -FilePath $env:ManageDSK -ArgumentList $ArgsListe

# -----[EOF]--------------------------------------------------