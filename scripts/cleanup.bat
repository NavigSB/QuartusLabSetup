@echo off

cd ..
dir /b | findstr /V /R "\.do$ \.sv$ \.sh$ doFiles scripts src Makefile" | for /F "delims=" %%i in ('more') do @del /F /Q "%%i" >nul 2>&1
cd scripts
dir /b | findstr /R "\.sv$" | for /F "delims=" %%i in ('more') do @del /F /Q "%%i" >nul 2>&1
