@echo off
set WORKINGDIR=""
set WORKINGDIR=%~dp0
for %%f in ("%WORKINGDIR%") do set WORKINGDIR=%%~sf
echo ############################################################
echo #                     Boot Extractor                       #
echo #               Do not close this window!!                 #
echo #     Otherwise your boot.img will be not extracted.       #
echo ############################################################
7z.exe e %systemdrive%\rom.zip -o%systemdrive%\ boot.img -r -y
echo.
echo Completed.

