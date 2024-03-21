@ECHO OFF
:: ============================================================
:: Script:  build.cmd
:: Comment: Build an Amstrad project on DSK file
:: ============================================================

:: Step inside CMD
::CD cmd

:: ------------------------------------------------------------
:: Check parameters
:: ------------------------------------------------------------
:CHECKARG
IF [%1]==[] (
	ECHO.
    ECHO Argument 1 is not present, aborting.
    GOTO END
) 
IF [%2]==[] (
	ECHO.
    ECHO Argument 2 is not present, aborting.
    GOTO END
)

:: Show what's going on
ECHO.
ECHO Current full project directory: %1
ECHO Current project directory Name: %2
ECHO Curent folder file:             %3 
ECHO Curent file:                    %4
ECHO Curent file with no extention:  %5
ECHO Curent file extention:          %6

ECHO.
ECHO I'm here: %CD%

:: ------------------------------------------------------------
:: Set env
:: ------------------------------------------------------------
SETLOCAL

CALL cmd\set.cmd

:: ------------------------------------------------------------
:: Check if DSK existe (projet/dsk)
:: ------------------------------------------------------------

ECHO.
ECHO Check for %3\dsk\%3.dsk

IF NOT EXIST %3\dsk\%3.dsk (
    ECHO.
    ECHO %3\dsk\%3.dsk doesn't exist, try to build it.
    CALL cmd\buildDSK.cmd %3
) ELSE (
    ECHO.
    ECHO File %3\dsk\%3.dsk exist, continue.
)

GOTO CHECKFILE

:: ------------------------------------------------------------
:: Check file
:: ------------------------------------------------------------
:CHECKFILE
:: if ASM
IF /I "%6"==".asm" (
    CALL cmd\ASMBuild.cmd
    IF %ERRORLEVEL% NEQ 0 (
        GOTO BINERROR
    )
    SET NEWFILE=%5.BIN
)
:: if BAS
IF /I "%6" EQU ".bas" (
    SET NEWFILE=%5%6
)
ECHO.
ECHO File to ADD: %NEWFILE%
GOTO ADDTODSK

:: ------------------------------------------------------------
:: Add files to dsk
:: ------------------------------------------------------------
:ADDTODSK
CALL cmd\addFileToDSK.cmd %3 %NEWFILE%
IF %ERRORLEVEL% NEQ 0 (
    GOTO ADDDSKERROR
)

GOTO END

:: ------------------------------------------------------------
:: Build bin from ASM failed
:: ------------------------------------------------------------
:BUILDBINERROR
ECHO.
ECHO ERROR : Problem to build BIN from ASM.
ECHO.
SET %RETURNCODE%=1
GOTO END

:: ------------------------------------------------------------
:: Adding files to DSK failed
:: ------------------------------------------------------------
:ADDDSKERROR
ECHO.
ECHO ERROR : Problem to insert files in the ".dsk" file.
ECHO.
SET %RETURNCODE%=1
GOTO END

:: ------------------------------------------------------------
:: End, %RETURNCODE% is evaluated before ENDLOCAL
:: ------------------------------------------------------------
:END
CALL cmd/unset.cmd
CD ..
ENDLOCAL && EXIT /b %RETURNCODE%
:: -----[EOF]--------------------------------------------------