@rem Gradle wrapper script for Windows.
@echo off

setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
set APP_HOME=%DIRNAME%

set WRAPPER_JAR=%APP_HOME%gradle\wrapper\gradle-wrapper.jar
set JAVA_EXE=java.exe
if defined JAVA_HOME set JAVA_EXE=%JAVA_HOME%\bin\java.exe

if exist "%WRAPPER_JAR%" (
    "%JAVA_EXE%" -classpath "%WRAPPER_JAR%" org.gradle.wrapper.GradleWrapperMain %*
) else (
    gradle %*
)

endlocal
