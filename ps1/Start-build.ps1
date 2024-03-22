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
    .INPUTS
        
    .OUTPUTS
        
    .EXAMPLE
        
    .LINK
        
    .NOTE
        Author: VFD
#>

# $env:nom_variable = "valeur"

# ------------------------------------------------------------
# 6 parameters needed
# ------------------------------------------------------------
param(
    $param1,
    $param2,
    $param3,
    $param4,
    $param5,
    $param6
)

# Initialize exit code to 0 (success)
$exitCode = 0


# ------------------------------------------------------------
# Function END
# ------------------------------------------------------------
function END {
    # Exit with the specified exit code
    exit $exitCode
}

# ------------------------------------------------------------
# Check if any parameters are missing
# ------------------------------------------------------------
if (-not $param1 -or -not $param2 -or -not $param3 -or -not $param4 -or -not $param5 -or -not $param6) {
    Write-Host
    Write-Host "Not all 6 parameters were provided." -ForegroundColor Red
    Write-Host "Please provide all 6 parameters."
    # Set exit code to 1 (failure)
    $exitCode = 1
    # Call the END function
    END
} else {
    # If the script gets here, then all 6 parameters were provided
    Write-Host
    Write-Host "All 6 parameters were provided."
}


# ------------------------------------------------------------
# if ASM
# ------------------------------------------------------------

# to do

# ------------------------------------------------------------
# Add to DSK
# ------------------------------------------------------------





END
# -----[EOF]--------------------------------------------------