@echo off
setlocal
cd /d "%~dp0"
if not defined JAVA_HOME set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-25.0.5.10002-hotspot"
if not exist "%JAVA_HOME%\bin\java.exe" (
  echo ERROR: Java 25 runtime not found at "%JAVA_HOME%\bin\java.exe".
  exit /b 1
)
if not exist "out\Main.class" (
  echo ERROR: Compiled classes not found. Run compile.bat first.
  exit /b 1
)
echo Starting Stock Price Predictor...
"%JAVA_HOME%\bin\java.exe" -cp "out;lib/*" Main
