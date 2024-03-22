@ECHO OFF
:: ============================================================
:: Script:  build.cmd
:: Comment: Build an Amstrad project on DSK file
:: ============================================================

:: ------------------------------------------------------------
:: init
:: ------------------------------------------------------------
SETLOCAL

SET RETURNCODE=1

:: ------------------------------------------------------------
:: Check parameters
:: ------------------------------------------------------------
:CHECKARG
:: Count the number of parameters
SET argCount=0
FOR %%x IN (%*) DO (
    SET /A argCount+=1
)

:: Check if the number of parameters is equal to 6
IF %argCount% NEQ 6 (
    ECHO.
    ECHO Incorrect number of parameters. You must pass exactly 6 parameters.
    SET RETURNCODE=1
    GOTO END
)

:: ------------------------------------------------------------
:: Show what's going on
:: ------------------------------------------------------------
ECHO.
ECHO Current full project directory: %1
ECHO Current project directory Name: %2
ECHO Curent folder file:             %3 
ECHO Curent file:                    %4
ECHO Curent file with no extention:  %5
ECHO Curent file extention:          %6

:: ------------------------------------------------------------
:: Set env, no need to start this if not sure
:: ------------------------------------------------------------
CALL cmd\set.cmd

:: ------------------------------------------------------------
:: Check if DSK existe (projet/dsk)
:: The reason is if we need to add more than one file
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
        ECHO.
        ECHO ERROR : Problem to build BIN from ASM.
        SET %RETURNCODE%=1
        GOTO END
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
    ECHO.
    ECHO ERROR : Problem to insert files in the ".dsk" file.
    SET %RETURNCODE%=1
    GOTO END
)

GOTO END

:: ------------------------------------------------------------
:: End, %RETURNCODE% is evaluated before ENDLOCAL
:: ------------------------------------------------------------
:END
CALL cmd/unset.cmd
CD ..
ENDLOCAL && EXIT /b %RETURNCODE%
:: -----[EOF]--------------------------------------------------