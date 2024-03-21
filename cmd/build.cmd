@ECHO OFF
:: ============================================================
:: Script:  build.cmd
:: Comment: Build an Amstrad project on DSK file
:: ============================================================

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

ECHO Current full project directory: %1
ECHO Current project directory Name: %2
ECHO Curent folder file:             %3 
ECHO Curent file:                    %4
ECHO Curent file with no extention:  %5
ECHO Curent file extention:          %6

PAUSE

GOTO END

:: ------------------------------------------------------------
:: Set env
:: ------------------------------------------------------------
SETLOCAL

CALL set.cmd

:: ------------------------------------------------------------
:: Check if DSK existe (projet/dsk)
:: ------------------------------------------------------------
IF /I NOT EXIST file.dsk (
    CALL cmd/buildDSK.cmd "FileFolder"
)



:: ------------------------------------------------------------
:: Build if ASM
:: ------------------------------------------------------------
IF /I "fileextention" is ASM (
    CALL cmd/ASMBuild.cmd
)

:: ------------------------------------------------------------
:: Add files to dsk
:: ------------------------------------------------------------
CALL cmd/addFilesDSK.cmd
IF %ERRORLEVEL% NEQ 0 (
    GOTO ADDDSKERROR
)



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
CALL unset.cmd
ENDLOCAL && EXIT /b %RETURNCODE%
:: -----[EOF]--------------------------------------------------