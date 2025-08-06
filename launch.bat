@echo off
:: ====================================================================
:: Python Embeddable Project Launcher - Template
::
:: This script sets up a portable Python environment and runs the
:: main Python script. The first run will take longer as it
:: installs pip and all required packages.
:: ====================================================================
CLS

:: --- Configuration ---
SET PYTHON_DIR=python-embed
SET PYTHON_EXE=%PYTHON_DIR%\python.exe
SET REQUIREMENTS_FILE=requirements.txt
SET MAIN_SCRIPT=main.py

:: --- TEMPLATE NOTE ---
:: The line below is the MOST IMPORTANT line to change for new projects.
:: It MUST match the version of Python you download.
:: e.g., for Python 3.12, it would be 'python312._pth'.
SET PYTHON_PTH_FILE=%PYTHON_DIR%\python311._pth

:: ====================================================================

:: Check if setup has already been run by looking for the Scripts folder.
IF EXIST "%PYTHON_DIR%\Scripts\pip.exe" (
    GOTO launch
) ELSE (
    GOTO first_run
)

:: --- First Run Setup Block ---
:first_run
echo.
echo  First-time setup detected. This may take several minutes.
echo  Please be patient while the environment is prepared...
echo.

:: 1. Enable site-packages in the embeddable python instance.
echo  [Step 1/3] Enabling package installation...
:: We uncomment the 'import site' line in the ._pth file.
powershell -Command "(Get-Content '%PYTHON_PTH_FILE%') -replace '#import site', 'import site' | Set-Content '%PYTHON_PTH_FILE%'"
IF %ERRORLEVEL% NEQ 0 (
    echo  ERROR: Failed to modify the ._pth file.
    echo  Please ensure that '%PYTHON_PTH_FILE%' exists and is not write-protected.
    GOTO end
)

:: 2. Install pip.
echo  [Step 2/3] Installing pip...
powershell -NoProfile -ExecutionPolicy Bypass -Command "(New-Object System.Net.WebClient).DownloadFile('https://bootstrap.pypa.io/get-pip.py', 'get-pip.py')"
"%PYTHON_EXE%" get-pip.py
del get-pip.py
IF %ERRORLEVEL% NEQ 0 (
    echo  ERROR: Failed to install pip. Check your internet connection.
    GOTO end
)

:: 3. Install all required packages from requirements.txt.
echo  [Step 3/3] Installing dependencies from %REQUIREMENTS_FILE%...
"%PYTHON_EXE%" -m pip install -r "%REQUIREMENTS_FILE%"
IF %ERRORLEVEL% NEQ 0 (
    echo  ERROR: Failed to install required packages. Check your internet connection and %REQUIREMENTS_FILE%.
    GOTO end
)

echo.
echo  Setup complete!
GOTO launch

:: --- Application Launch Block ---
:launch
echo.
echo  Launching the application...
echo.
"%PYTHON_EXE%" "%MAIN_SCRIPT%"
GOTO end

:: --- End of Script ---
:end
echo.
echo  Script finished.
pause