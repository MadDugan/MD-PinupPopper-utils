rem *********************************
rem Scan for tables and check for matching backglass
rem *********************************

@echo off
setlocal enabledelayedexpansion enableextensions

set "targetExt=.directb2s"
set shortTime=%time:~0,8%
set shortTime=%shortTime: =0%

set "filename=NeedBG_%date:/=%_%shortTime::=%.txt"

echo Missing Backglass... > "%filename%"

for %%F in ("*.vpx") do (
    echo Found: %%~nxF
    rem Replace the extension and check for file
    set "bgFileName=%%~nF%targetExt%"
    echo Checking !bgFileName!
	if exist !bgFileName! (
	    echo  background exists!
	) else (
	    echo  !bgFileName! missing >> "%filename%"
	)
)
