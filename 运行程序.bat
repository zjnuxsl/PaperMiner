@echo off
setlocal EnableDelayedExpansion
chcp 65001 >nul

echo ========================================
echo PaperMiner - 智能论文内容提取工具
echo ========================================
echo.

:: Environment name (can be modified)
set "ENV_NAME=MinerU"

:: Switch to script directory (repository root)
cd /d "%~dp0"

:: Auto-detect Conda installation location
set "CONDA_BAT="
echo Detecting Conda installation...

:: Method 1: Try to find conda from PATH
for %%I in (conda.exe) do if exist "%%~$PATH:I" (
    for %%F in ("%%~$PATH:I") do set "CONDA_BAT=%%~dpF..\condabin\conda.bat"
    goto :conda_found
)

:: Method 2: Try common Conda installation locations
for %%P in (
    "%USERPROFILE%\miniconda3"
    "%USERPROFILE%\anaconda3"
    "C:\ProgramData\miniconda3"
    "C:\ProgramData\anaconda3"
    "%LOCALAPPDATA%\miniconda3"
    "%LOCALAPPDATA%\anaconda3"
) do (
    if exist "%%~P\condabin\conda.bat" (
        set "CONDA_BAT=%%~P\condabin\conda.bat"
        goto :conda_found
    )
)

:: If not found, provide friendly message
echo ========================================
echo Conda installation not found
echo ========================================
echo Please install Anaconda or Miniconda first
echo Download: https://www.anaconda.com/products/distribution
echo Or: https://docs.conda.io/en/latest/miniconda.html
echo.
echo Please run this script again after installation
pause
exit /b 1

:conda_found
echo Found Conda: %CONDA_BAT%

:: Check if environment exists and get its path
echo Checking %ENV_NAME% environment...
set "ENV_PATH="
for /f "tokens=1,2*" %%a in ('call "%CONDA_BAT%" env list ^| findstr "%ENV_NAME%"') do (
    if "%%a"=="%ENV_NAME%" set "ENV_PATH=%%b"
)

if "%ENV_PATH%"=="" (
    echo ========================================
    echo %ENV_NAME% environment not found
    echo ========================================
    echo Please create the environment first, run these commands:
    echo   conda create -n %ENV_NAME% python=3.12 -y
    echo   conda activate %ENV_NAME%
    echo   pip install -U "mineru[core]"
    echo   pip install python-docx
    echo.
    echo For detailed steps, refer to docs\快速安装指南.md
    pause
    exit /b 1
)

echo Found environment at: %ENV_PATH%

:: Set Python executable path
set "PYTHON_EXE=%ENV_PATH%\python.exe"
if not exist "%PYTHON_EXE%" (
    echo ========================================
    echo ERROR: Python executable not found!
    echo ========================================
    echo Expected location: %PYTHON_EXE%
    pause
    exit /b 1
)

:: Activate environment (for environment variables)
echo Activating %ENV_NAME% environment...
call "%CONDA_BAT%" activate %ENV_NAME%
if errorlevel 1 (
    echo ========================================
    echo Environment activation failed
    echo ========================================
    echo Please check if the environment is properly installed
    pause
    exit /b 1
)

:: Set environment variables to avoid OpenMP conflicts and charset warnings
echo Setting environment variables to prevent runtime conflicts...
set "KMP_DUPLICATE_LIB_OK=TRUE"
set "OMP_NUM_THREADS=1"
set "PYTHONIOENCODING=utf-8"

:: Check if GUI script exists
echo Checking if GUI script exists...
if not exist "scripts\batch_pdf_processor_gui.py" (
    echo ========================================
    echo ERROR: GUI script not found!
    echo ========================================
    echo File scripts\batch_pdf_processor_gui.py does not exist
    echo Please check if you are in the correct directory
    echo Current directory: %CD%
    pause
    exit /b 1
)
echo GUI script found: scripts\batch_pdf_processor_gui.py

:: Show Python version and environment info
echo ========================================
echo Environment Information
echo ========================================
echo Python version:
"%PYTHON_EXE%" --version
echo.
echo Python executable location:
echo %PYTHON_EXE%
echo.
echo Installed packages (showing key ones):
"%PYTHON_EXE%" -m pip list | findstr -i "mineru torch pandas"
echo.

:: Run Python GUI program
echo ========================================
echo Starting GUI...
echo ========================================
echo.
"%PYTHON_EXE%" scripts\batch_pdf_processor_gui.py

:: Capture the exit code
set "EXIT_CODE=%ERRORLEVEL%"
echo.
echo ========================================
echo Program finished with exit code: %EXIT_CODE%
echo ========================================

:: If error occurs, display error message and pause
if %EXIT_CODE% neq 0 (
    echo.
    echo ERROR: Program execution failed!
    echo ========================================
    echo Troubleshooting steps:
    echo 1. Check if %ENV_NAME% environment is properly activated
    echo 2. Verify dependencies are installed:
    echo    pip install -U "mineru[core]"
    echo    pip install pandas openpyxl beautifulsoup4 python-docx lxml
    echo    pip install requests python-dotenv
    echo 3. Check if scripts\batch_pdf_processor_gui.py file exists
    echo 4. Review any error messages above
    echo.
    echo For detailed installation guide, see: docs\快速安装指南.md
    echo.
    pause
    exit /b %EXIT_CODE%
)

echo.
echo ========================================
echo Program completed successfully!
echo ========================================
echo Thank you for using PaperMiner
pause
