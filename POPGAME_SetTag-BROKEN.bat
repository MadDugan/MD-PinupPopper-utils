:: *********************************
:: Sets tag for game based on file name. Create different named copies for different tags
:: requires SQLITE3 command line tools to be installed and placed in main PinUp directory 
:: Tag is everything after dash in file name E.g. POPGAME_SetTag-SSF.bat would add 'SSF' tag.
:: *********************************

:: parameters %1 = GAMEID from Games Table,  and %2 is full GameFileName.

@echo off

setlocal enabledelayedexpansion enableextensions

if /I "%~x2" NEQ ".vpx" goto end

:: move up one directory 
cd..

:: *********************************
:: get TAG from filename
:: *********************************
set "filename=%~n0"

for /f "tokens=2 delims=- " %%a in ("%filename%") do (
  set newTag=%%a
)

:: *********************************
:: Create SQLITE command to prepend new tag
:: Does not check for duplicate tags
:: *********************************
set dbcmd=sqlite3.exe PUPdatabase.db "UPDATE Games set TAGS = '%newTag% ' || TAGS where GameID=%1;"
%dbcmd%

:end
