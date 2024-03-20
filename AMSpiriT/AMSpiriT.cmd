@ECHO OFF
:: ============================================================
:: Script:  Amspirit.cmd
:: Comment: start emulator
:: ============================================================
SETLOCAL
:: ------------------------------------------------------------
:: Define what we need
:: ------------------------------------------------------------
SET AMSpirit="Amspirit.exe"
SET AMSpiritFolder=AMSpirit

:: ------------------------------------------------------------
:: Check if AMSpiriT is available
:: ------------------------------------------------------------
IF /I EXIST "%AMSpiritFolder%\%AMSpirit%" (
	ECHO.
	ECHO %AMSpirit% located in %AMSpiritFolder%
	ECHO.
	GOTO CHECKARG
) ELSE (
	ECHO.
	ECHO %AMSpirit% not found in %AMSpiritFolder%
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
CD %AMSpiritFolder%
%AMSpiriT% --dsk ..\%1 --run %2
CD ..
GOTO END

:: ------------------------------------------------------------
:: END
:: ------------------------------------------------------------
:END
ENDLOCAL
:: -----[EOF]--------------------------------------------------