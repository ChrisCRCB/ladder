@echo off
setlocal ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

REM ------------------------------------------------------------
REM Build Windows release and zip with 7-Zip
REM Output: ladder-win64-{version}.zip
REM ------------------------------------------------------------

set "OUTPUT_DIR=build\windows\x64\runner\Release"
set "PROJECT_ROOT=%CD%"

echo === STEP 1: Checks ===
if not exist "pubspec.yaml" (
  echo [ERROR] pubspec.yaml not found in %PROJECT_ROOT%
  exit /b 1
)
where flutter
if errorlevel 1 (
  echo [ERROR] Flutter not found on PATH.
  exit /b 1
)
where 7z
if errorlevel 1 (
  echo [ERROR] 7z not found on PATH. Install 7-Zip and add 7z.exe to PATH.
  exit /b 1
)

echo.
echo === STEP 2: Get version from pubspec.yaml ===
set "VERSIONLINE="
for /f "usebackq delims=" %%L in (`findstr /R /I /C:"^[ ]*version[ ]*:" "pubspec.yaml"`) do (
  if not defined VERSIONLINE set "VERSIONLINE=%%L"
)
if not defined VERSIONLINE (
  echo [ERROR] Couldn't find a line like "version: 1.2.3+4" in pubspec.yaml.
  exit /b 1
)

for /f "tokens=1,* delims=:" %%A in ("%VERSIONLINE%") do set "APP_VERSION=%%B"
for /f "tokens=1 delims=#" %%A in ("%APP_VERSION%") do set "APP_VERSION=%%A"
set "APP_VERSION=%APP_VERSION:"=%"
call :trim APP_VERSION
if "%APP_VERSION%"=="" (
  echo [ERROR] Empty version string parsed from pubspec.yaml
  exit /b 1
)
echo [INFO] Version: %APP_VERSION%

echo.
echo === STEP 3: Build Windows release ===
echo flutter build windows --release
flutter build windows --release
if errorlevel 1 (
  echo [ERROR] Flutter build failed.
  exit /b 1
)

if not exist "%OUTPUT_DIR%" (
  echo [ERROR] Missing output dir: %OUTPUT_DIR%
  exit /b 1
)
echo [INFO] Output dir contents:
dir /b "%OUTPUT_DIR%"

echo.
echo === STEP 4: Zip with 7-Zip ===
set "ZIP_NAME=ladder-win64-%APP_VERSION%.zip"
set "ZIP_PATH=%PROJECT_ROOT%\%ZIP_NAME%"
if exist "%ZIP_PATH%" (
  echo [INFO] Deleting existing %ZIP_PATH%
  del /f /q "%ZIP_PATH%"
)

REM Create a listfile so 7z doesn’t rely on cmd’s wildcard expansion
set "LISTFILE=%TEMP%\ladder_zip_list_%RANDOM%.txt"
pushd "%OUTPUT_DIR%" || ( echo [ERROR] pushd failed & exit /b 1 )

echo [INFO] Building file list at: %LISTFILE%
REM Add everything (files and dirs) relative to OUTPUT_DIR
dir /b /a > "%LISTFILE%"

echo [INFO] Running: 7z a -tzip "%ZIP_PATH%" @%LISTFILE%
7z a -tzip "%ZIP_PATH%" @%LISTFILE%
set "ZIP_RC=%ERRORLEVEL%"

popd

del /q "%LISTFILE%" >nul 2>&1

if not "%ZIP_RC%"=="0" (
  echo [ERROR] 7z returned errorlevel %ZIP_RC%
  exit /b 1
)

if exist "%ZIP_PATH%" (
  echo [SUCCESS] Created: %ZIP_PATH%
  exit /b 0
) else (
  echo [ERROR] 7z reported success but file not found: %ZIP_PATH%
  exit /b 1
)

REM ---------------- helpers ----------------
:trim
REM Usage: call :trim VAR_NAME
setlocal ENABLEDELAYEDEXPANSION
set "s=!%~1!"
for /f "tokens=* delims= " %%a in ("!s!") do set "s=%%a"
:trim_loop
if not "!s!"=="" if "!s:~-1!"==" " ( set "s=!s:~0,-1!" & goto trim_loop )
endlocal & set "%~1=%s%"
goto :eof
