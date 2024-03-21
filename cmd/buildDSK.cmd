@ECHO OFF
:: ============================================================
:: Script:  buildDSK.cmd
:: Comment: Create a DSK file in project
:: ============================================================

:: ------------------------------------------------------------
:: Set return code to 0 (OK)
:: ------------------------------------------------------------
SET RETURNCODE=0

:: ------------------------------------------------------------
:: Check parameters
:: ------------------------------------------------------------
:CHECKARG
IF [%1]==[] (
	ECHO.
    ECHO Argument 1 is not present, aborting.
    SET RETURNCODE=1
    GOTO END
)

:: ------------------------------------------------------------
:: Build DSK
:: ------------------------------------------------------------
:BUILDDSK
ECHO.
ECHO Building disk: %1\dsk\%1.dsk
ECHO %ManageDSKFolder%\%ManageDSK% -C -S%1\dsk\%1.dsk
%ManageDSKFolder%\%ManageDSK% -C -S%1\dsk\%1.dsk

:: ------------------------------------------------------------
:: Check DSK
:: ------------------------------------------------------------
:CONTROLRESULT
IF /I NOT EXIST %1\dsk\%1.dsk (
    ECHO.
    ECHO Failed to create %1\dsk\%1.dsk.
    SET RETURNCODE=1
    GOTO END
)

ECHO.
ECHO %1\dsk\%1.dsk is created.

:: ------------------------------------------------------------
:: End, %RETURNCODE%
:: ------------------------------------------------------------
:END
EXIT /b %RETURNCODE%
:: -----[EOF]--------------------------------------------------