@echo off
setlocal
cd /d "%~dp0"
echo ========================================
echo  Compiling Stock Price Predictor (JDK 25)
echo ========================================

if not defined JAVA_HOME set "JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-25.0.5.10002-hotspot"
if not exist "%JAVA_HOME%\bin\javac.exe" (
  echo ERROR: JDK 25 compiler not found at:
  echo "%JAVA_HOME%\bin\javac.exe"
  echo Please install JDK 25 or set JAVA_HOME correctly.
  exit /b 1
)
if not exist "lib\sqlite-jdbc-3.46.1.3.jar" (
  echo ERROR: Required lib folder or SQLite JDBC jar is missing.
  exit /b 1
)
if not exist "src\main\java\Main.java" (
  echo ERROR: src\main\java\Main.java not found. Run this file from the extracted project folder.
  exit /b 1
)
if not exist out mkdir out
"%JAVA_HOME%\bin\javac.exe" --release 25 -encoding UTF-8 -cp "lib/*" -sourcepath "src/main/java" -d out "src/main/java/Main.java"
if errorlevel 1 (
  echo.
  echo COMPILATION FAILED.
  exit /b 1
)
echo.
echo COMPILATION SUCCESSFUL. You can now run run.bat.
exit /b 0
