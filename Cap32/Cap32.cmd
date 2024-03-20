@ECHO OFF
:: ============================================================
:: Script:  cap32.cmd
:: Comment: start emulator
:: ============================================================
SETLOCAL
:: ------------------------------------------------------------
:: Define what we need
:: ------------------------------------------------------------
SET CAP32=cap32.exe
SET CAP32Folder=cap32-win64

:: ------------------------------------------------------------
:: Check if CAP32 is available
:: ------------------------------------------------------------
IF /I EXIST "%CAP32Folder%\%CAP32%" (
	ECHO.
	ECHO %CAP32% located in %CAP32Folder%
	ECHO.
	GOTO CHECKARG
) ELSE (
	ECHO.
	ECHO %CAP32% not found in %CAP32Folder%
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
ECHO %CAP32Folder%\%CAP32% -c %CAP32Folder%\cap32.cfg %1 -a run\"%2\"

ECHO CPC Caprice32 : %CPC_Cap32_Folder%

:: ------------------------------------------------------------
:: END
:: ------------------------------------------------------------
:END
ENDLOCAL
:: -----[EOF]--------------------------------------------------