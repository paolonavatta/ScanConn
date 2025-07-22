@echo off
setlocal

REM ScanConn Uninstaller v0.1.0 

REM Get the current directory 
set "script_dir=%~dp0"

REM Remove trailing backslash if present
if "%script_dir:~-1%"=="\" set "script_dir=%script_dir:~0,-1%"

echo Removing %script_dir% from the system PATH...

REM Get current PATH from registry
for /f "tokens=2*" %%A in (
  'reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path 2^>nul ^| findstr "Path"'
) do set "current_path=%%B"

REM Remove the directory from the path
setlocal enabledelayedexpansion
set "new_path=!current_path:%script_dir%=!"
endlocal & set "new_path=%new_path%"

REM Remove any duplicate semicolons
set "new_path=%new_path:;;=;%"

REM Remove leading or trailing semicolons
if "%new_path:~0,1%"==";" set "new_path=%new_path:~1%"
if "%new_path:~-1%"==";" set "new_path=%new_path:~0,-1%"

REM Update the system PATH in the registry
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v Path /t REG_EXPAND_SZ /d "%new_path%" /f

REM Notify the system about the environment change
setx PATH "%new_path%"

echo Uninstallation completed.

endlocal
pause
