@ECHO OFF
:: ============================================================
:: Script:  addFileToDSK.cmd
:: Comment: Add the file to the DSK
:: ============================================================

:: ------------------------------------------------------------
:: Set return code to 0 (OK)
:: ------------------------------------------------------------
SET RETURNCODE=0

echo in %0

:: ------------------------------------------------------------
:: Check parameters
:: ------------------------------------------------------------
:CHECKARG
IF [%1]==[] (
	ECHO.
    ECHO Argument 1 is not present, folder name, aborting.
    SET RETURNCODE=1
    GOTO END
)

IF [%2]==[] (
	ECHO.
    ECHO Argument 2 is not present, file neme, aborting.
    SET RETURNCODE=1
    GOTO END
)

:: ------------------------------------------------------------
:: Add to DSK
:: ------------------------------------------------------------
:ADDDSK
ECHO.
ECHO Add %2 to disk: %1\dsk\%1.dsk
ECHO %ManageDSKFolder%\%ManageDSK% -L%1\dsk\%1.dsk -A%2 -S%1\dsk\%1.dsk
::%ManageDSKFolder%\%ManageDSK% -C -S%1\dsk\%1.dsk

:: ------------------------------------------------------------
:: Check DSK
:: ------------------------------------------------------------
:CONTROLRESULT
IF /I NOT EXIST %1\dsk\%1.dsk (
    ECHO.
    ECHO Failed on %1\dsk\%1.dsk.
    SET RETURNCODE=1
    GOTO END
)

ECHO.
ECHO %1\dsk\%1.dsk is updated. Need to be checked.

:: ------------------------------------------------------------
:: End, %RETURNCODE%
:: ------------------------------------------------------------
:END
EXIT /b %RETURNCODE%
:: -----[EOF]--------------------------------------------------