@echo off
setlocal enabledelayedexpansion

:: Script info
echo [DEBUG] Starting GIF compression script...
echo [DEBUG] Script directory: %~dp0

:: Set input and output folders (same as script directory)
set "SCRIPT_DIR=%~dp0"
set "INPUT_FOLDER=%SCRIPT_DIR%input"
set "OUTPUT_FOLDER=%SCRIPT_DIR%output"

:: Debug folder paths
echo [DEBUG] Input folder: %INPUT_FOLDER%
echo [DEBUG] Output folder: %OUTPUT_FOLDER%

:: Create folders if they don't exist
if not exist "%INPUT_FOLDER%" (
    echo [DEBUG] Creating input folder...
    mkdir "%INPUT_FOLDER%"
) else (
    echo [DEBUG] Input folder already exists.
)

if not exist "%OUTPUT_FOLDER%" (
    echo [DEBUG] Creating output folder...
    mkdir "%OUTPUT_FOLDER%"
) else (
    echo [DEBUG] Output folder already exists.
)

:: Check if gifsicle is available
where gifsicle >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo [ERROR] gifsicle is not installed or not in PATH.
    echo [INFO] Download it from: https://www.lcdf.org/gifsicle/
    pause
    exit /b 1
) else (
    echo [DEBUG] gifsicle is available. Proceeding...
)

:: Count number of GIFs to process
set /a FILE_COUNT=0
for %%F in ("%INPUT_FOLDER%\*.gif") do set /a FILE_COUNT+=1
echo [DEBUG] Found %FILE_COUNT% GIF(s) to process.

:: Process each GIF in the input folder
set /a PROCESSED_COUNT=0
for %%F in ("%INPUT_FOLDER%\*.gif") do (
    set "INPUT_FILE=%%~F"
    set "OUTPUT_FILE=%OUTPUT_FOLDER%\%%~nxF"
    
    echo [PROCESSING] Compressing: %%~nxF...
    echo [DEBUG] Input: !INPUT_FILE!
    echo [DEBUG] Output: !OUTPUT_FILE!

    :: Compress with gifsicle (optimize, reduce colors, keep 60% quality)
    echo [DEBUG] Running: gifsicle -O3 --lossy=40 --colors 128 -o "!OUTPUT_FILE!" "!INPUT_FILE!"
    gifsicle -O3 --lossy=40 --colors 128 -o "!OUTPUT_FILE!" "!INPUT_FILE!"

    if exist "!OUTPUT_FILE!" (
        echo [SUCCESS] Saved compressed GIF: %%~nxF
    ) else (
        echo [ERROR] Failed to compress: %%~nxF
    )

    set /a PROCESSED_COUNT+=1
    echo [DEBUG] Progress: !PROCESSED_COUNT!/%FILE_COUNT%
)

echo [COMPLETE] All GIFs processed. Check output folder: %OUTPUT_FOLDER%
pause