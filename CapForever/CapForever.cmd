@ECHO OFF
:: ============================================================
:: Script:  cap32.cmd
:: Comment: start emulator
:: ============================================================
SETLOCAL
:: ------------------------------------------------------------
:: Define what we need
:: ------------------------------------------------------------
SET Caprice="Cap32.exe"
SET CapriceFolder=CapriceForever

:: ------------------------------------------------------------
:: Check if AMSpiriT is available
:: ------------------------------------------------------------
IF /I EXIST "%CAP32Folder%\%Caprice%" (
	ECHO.
	ECHO %Caprice% located in %CAP32Folder%
	ECHO.
	GOTO CHECKARG
) ELSE (
	ECHO.
	ECHO %Caprice% not found in %CAP32Folder%
	ECHO Check your directories.
	ECHO.
)
GOTO END

:: ------------------------------------------------------------
:: Cherck Arguments
:: ------------------------------------------------------------
:CHECKARG
IF [%1]==[] (
    ECHO Argument 1 is not present, aborting.
    GOTO END
) 
IF [%2]==[] (
    ECHO Argument 2 is not present, aborting.
    GOTO END
)
GOTO LAUNCH

:: ------------------------------------------------------------
:: Launch emulator
:: ------------------------------------------------------------
:LAUNCH
ECHO %CAP32Folder%\%Caprice% /DriveA=%1 /Command="run""%2"

:: ------------------------------------------------------------
:: END
:: ------------------------------------------------------------
:END
ENDLOCAL
:: -----[EOF]--------------------------------------------------