@echo off
color 0e
title HTC One X Modder -Fastboot Emergency Recharger-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /          Tool selected: Fastboot Emergency Recharger          /
echo   \                                                               \
echo   =================================================================
echo.
echo   NOTE: Your phone will repeatidly reboot during this process.
echo    Please be patient, this may take several minutes or hours.
echo.
if exist batstatus.txt del batstatus.txt
echo. 2>batstatus.txt
:LOOP
fastboot getvar battery-voltage >nul 2>batstatus.txt
ping /n 1 localhost >nul
for /f "tokens=1*delims=:" %%G in ('findstr /n "^" batstatus.txt') do if %%G equ 2 SET strBatVal=%%H
SET strVoltage=%strBatVal:battery-voltage: =%
SET /A Voltage=%strVoltage:mV=%
fastboot reboot-bootloader >nul 2>&1
ping /n 6 localhost >nul
cls
IF %Voltage% GEQ 3800 goto DONE else goto NEXT
:NEXT
color 0c
title HTC One X Modder -Recharging...-
echo.
echo   =================================================================
echo.
echo   The phone charge is currently at: %strVoltage%
echo   which is INSUFFICIENT for flashing!
echo.
echo   Current Time: %Time%
echo.
echo   Charging will continue... Please be patient... :)
echo.
echo   =================================================================
echo.
goto LOOP
:DONE
color 0a
title HTC One X Modder -Succesfully Recharged!!-
echo.
echo   =================================================================
echo.
echo   The phone charge is currently at: %strVoltage%
echo   which is SUFFICIENT for flashing! :)
echo.
echo   Current Time: %Time%
echo.
echo   If you haven't installed any custom recovery,
echo   press a key to return back to the menu,
echo   select 2nd option and flash a custom recovery.
echo.
echo   =================================================================
echo.
pause>nul