@echo off
@echo off
@echo off
mode con:cols=70 lines=30
set WORKINGDIR=""
set WORKINGDIR=%~dp0
for %%f in ("%WORKINGDIR%") do set WORKINGDIR=%%~sf
set resources=%WORKINGDIR%\Resources\
if exist %resources%\temp\ rmdir /S /Q %resources%\temp\
mkdir %resources%\temp\
set CUSTOM_ROM=%resources%\CUSTOM_ROM\
set SZ=%CUSTOM_ROM%\SZ\
set STOCK_ROM=%resources%\STOCK_ROM\
set FASTBOOT_CHARGER=%resources%\FASTBOOT_CHARGER\
set ADB_TOOLS=%resources%\ADB_TOOLS\
set CUSTOM_RECOVERY=%resources%\CUSTOM_RECOVERY\
set tempp=%resources%\temp\
set GUIDES=%resources%\GUIDES\
set SUPERSIZED=%GUIDES%\supersized\
set OLDSIZED=%GUIDES%\oldsized\
set FAQ=%resources%\FAQ\
set ROMBUILDER=%resources%\ROM_BUILDER\
set DRIVERS=%resources%\DRIVERS\
color 0e
:disclaimer
cls
title HTC One X Modder V1.0 -Disclaimer-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                            Disclaimer:                        /
echo   \ I'm not responsable for bricked devices, burned computers,    \
echo   / loss of data. thermonuclear war or any type of disaster.      /
echo   \ With this disclaimer, you are the only responsable for any    \
echo   / damage. You can watch into the batch script, and you're       /
echo   \ free to modify it at your own risk...If any problem or        \ 
echo   / error appear during any process (example ac loss, hard disk   /
echo   \ failing or other) I'm happy to help you! Don't worry!         \
echo   / If you want to support my work, press thanks button!          /
echo   \                                                               \
echo   =================================================================
set disclaimer=
set /p disclaimer=  If you accept them, type ACCEPT or type EXIT:
if "%disclaimer%" == "ACCEPT" goto checkdrivers
if "%disclaimer%" == "EXIT" goto exit
if "%disclaimer%" == "accept" goto checkdrivers
if "%disclaimer%" == "exit" goto exit
if "%disclaimer%" == "" goto invalidinput
:invalidinput
echo.
echo   Invalid Input. Press a key to try again...
pause>nul
cls
goto disclaimer
:exit
exit
:checkdrivers
cls
title HTC One X Modder V1.0 -Checking Drivers-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /           Checking if the HTC Drivers are installed...        /
echo   \                                                               \
echo   =================================================================
echo   Please wait...
ping -n 3 127.0.0.1 > nul
echo   ...
if exist %programfiles%\HTC\ goto driversexist
if not exist %programfiles%\HTC\ goto driversnotfound
:driversexist
cls
color 0a
title HTC One X Modder V1.0 -Booting up...
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                  Completed!!! Booting up...                   /
echo   \                                                               \
echo   =================================================================
echo   Drivers already exist/Aborted process.
echo. 
echo   Please wait a second... Booting up...
ping -n 5 127.0.0.1 > nul
goto OneXModder
:driversnotfound
cls
color 0c
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                     Drivers NOT Found!!!!                     /
echo   \                                                               \
echo   =================================================================
echo   Drivers NOT Found!! Would you like to install it??
set driversreq=
set /P driversreq=   Please type Y for yes, N for no or exit: 
if "%driversreq%" == "Y" goto installdrivers
if "%driversreq%" == "N" goto driversexist
if "%driversreq%" == "" goto driverserror
if "%driversreq%" == "exit" goto exit
:driverserror
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto driversnotfound
:installdrivers
cls
color 0d
title HTC One X Modder V1.0 -Installing Drivers-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                     Installing Drivers...                     /
echo   \                                                               \
echo   =================================================================
echo   Please wait... The drivers will be installed...
cd %DRIVERS%\
start HTCDRIVER.exe
ping -n 10 127.0.0.1 > nul
echo   ...
echo.
echo   Press a key when the drivers are installed...
pause>nul
goto driversexist
:OneXModder
title HTC One X Modder V1.0
cls
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                 Please select a choice:                       /
echo   \                                                               \
echo   =================================================================
echo   0)  Upgrade HBOOT! 
echo   1)  Unlock your bootloader
echo   2)  Flash a recovery (REQUIRES BOOTLOADER UNLOCKED)
echo   3)  Root your device (REQUIRES BOOTLOADER UNLOCKED)
echo   4)  Flash a Custom ROM/Build a Custom ROM
echo   5)  Verify fastboot/adb status connection/get all info
echo   6)  CID/MID Reader
echo   7)  Charge your phone (FASTBOOT MODE,when you can't flash anything)
echo   8)  Lock your bootloader
echo   9)  About this program
echo   10) Say thanks for support my work! (will open your browser)
echo   11) Open Changelog
set choiceone=
set /p choiceone=  Please select a choice or type exit or type FAQ:
if "%choiceone%" == "0" goto choicezero
if "%choiceone%" == "1" goto choiceonee
if "%choiceone%" == "2" goto choicetwo
if "%choiceone%" == "3" goto choicethree
if "%choiceone%" == "4" goto choicefour
if "%choiceone%" == "5" goto choicefive
if "%choiceone%" == "6" goto choicesix
if "%choiceone%" == "7" goto choiceseven
if "%choiceone%" == "8" goto choiceotto
if "%choiceone%" == "9" goto choicenine
if "%choiceone%" == "10" goto choiceten
IF "%choiceone%" == "11" goto choiceeleven
if "%choiceone%" == "FAQ" goto faq
if "%choiceone%" == "faq" goto faq
if "%choiceone%" == "exit" exit
if "%choiceone%" == "" goto choiceoneinvalid
:choiceoneinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto OneXModder
:choiceten
start http://forum.xda-developers.com/showthread.php?t=3340395
goto OneXModder
:faq
call %FAQ%\FAQ.bat
goto OneXModder
:choiceotto
cls
title HTC One X Modder V1.0 -Bootloader Locker-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /               Tool selected: Bootloader Locker!               /
echo   \                                                               \
echo   =================================================================
echo   This tool will lock/relock your bootloader...
echo   Please reboot your phone in bootloader mode and connect
echo   it to your pc. Press a key when you have done...
pause>nul
cls
title HTC One X Modder V1.0 -Bootloader Locker-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /               Tool selected: Bootloader Locker!               /
echo   \                                                               \
echo   =================================================================
echo   Processing... Do not unplug your device!
cd %ADB_TOOLS%\
fastboot oem lock
echo.
echo   Done! Press a key to return to the menu...
pause>nul
goto OneXModder  
:choicezero
cls
cd %ADB_TOOLS%\
color 0c
title HTC One X Modder V1.0 -HBOOT Flasher-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                Tool selected: HBOOT Flasher !                 /
echo   \                                                               \
echo   ================================================================= 
echo   Please, firstly make a full backup. If you are using a custom rom,
echo   your boot.img will be restored. This is extremely useful
echo   but dangerous too.
echo.
set cidhboot=
set /p cidhboot=   Are you sure you want to upgrade your HBOOT? (Y/N)
if "%cidhboot%" == "Y" goto hbootyes
if "%cidhboot%" == "N" goto hbootno
if "%cidhboot%" == "" goto cidinvalid
:cidinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto choicezero
:hbootno
echo.
echo   Aborted. Press a key to return to the menu...
pause>nul
goto OneXModder
:hbootyes
cls
cd %ADB_TOOLS%\
color 0c
title HTC One X Modder V1.0 -HBOOT Flasher-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                Tool selected: HBOOT Flasher !                 /
echo   \                                                               \
echo   =================================================================
echo   Now, check your cid, google "HBOOT htc one x cid xxx_XXX"
echo   when xxx_XXX is your cid (like HTC_001) and download it.
echo   You can find them easily on XDA.
echo   Browse in the folder and Place them in your system drive.  
echo   If you have a custom ROM installed, pick up your ROM zip, 
echo   rename it "rom.zip" without quotes and place them into your
echo   system drive. I will unpack it and flash new boot.img
echo   because when you upgrade your HBOOT, if you have
echo   a custom rom, your boot.img will be replaced with the stock one.   
echo.
echo   File info: This is the zip file for upgrade your HBOOT.
echo   Name: firmware.zip   Size: ~12MB    Type: Fastboot zip flashable
echo.
echo   Press a key to continue... Now the process will be automated.
pause>nul
cls
cd %ADB_TOOLS%\
color 0c
title HTC One X Modder V1.0 -HBOOT Flasher-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                Tool selected: HBOOT Flasher !                 /
echo   \                                                               \
echo   =================================================================
echo   Rebooting in RUU mode...
fastboot reboot rebootRUU
echo   Done. Flashing firmware.zip...
if exist %systemdrive%\firmware.zip copy %systemdrive%\firmware.zip %ADB_TOOLS%\
fastboot flash zip firmware.zip
echo   Done. Rebooting in download mode...
fastboot reboot bootloader
ping -n 6 127.0.0.1 > nul
echo   Done. Checking if there is any rom.zip in your system drive...
if not exist %systemdrive%\rom.zip goto hbootupgfinish
if exist %systemdrive%\rom.zip goto romreplacer
:romreplacer
echo   A rom.zip was found. Unpacking it...
cd %FASTBOOT_CHARGER%\
call boot_extractor.bat
echo.
echo   Done. Flashing boot.img...
cd %ADB_TOOLS%\
copy %systemdrive%\boot.img %tempp%\
cd %ADB_TOOLS%\
if not exist %tempp%\fastboot.exe copy %ADB_TOOLS%\*.* %tempp%\
cd %tempp%\
fastboot flash boot boot.img
echo.
echo   Done. Wiping cache and dalvik...
cd %ADB_TOOLS%\
fastboot erase cache
echo.
echo   Done. Rebooting...
fastboot reboot
echo   Done. Press any key to return to the menu...
pause>nul
goto OneXModder
:hbootupgfinish
echo.
echo   No rom.zip files are found on your %systemdrive%\
echo   Erasing cache...
cd %ADB_TOOLS%\
fastboot erase cache
echo   Done. Press a key to return to the menu...
pause>nul
goto OneXModder
:choicesix
cls
color 0d
title HTC One X Modder V1.0 -CID/MID Reader-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                Tool selected: CID/MID Reader!                 /
echo   \                                                               \
echo   =================================================================
echo   Do you want to read CID or MID?
set reader=
set /p reader=   Please type CID or MID: 
if "%reader%" == "CID" goto cid
if "%reader%" == "MID" goto mid
if "%reader%" == "" goto readerinvalid
:readerinvalid
echo.
echo   Invalid Input. Press any key to retry...
pause>nul
goto choicesix
:cid
cls
color 0d
title HTC One X Modder V1.0 -CID Reader-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                  Tool selected: CID Reader!                   /
echo   \                                                               \
echo   =================================================================
echo   Your cid:
cd %ADB_TOOLS%\
fastboot oem readcid
echo.
echo.
echo   Press a key to return to the menu...
pause>nul
goto OneXModder
:mid
cls
color 0d
title HTC One X Modder V1.0 -MID Reader-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                  Tool selected: MID Reader!                   /
echo   \                                                               \
echo   =================================================================
echo   Your MID (aka Model ID:)
cd %ADB_TOOLS%\
fastboot getvar mid
echo.
echo.
echo   Press a key to return to the menu...
pause>nul
goto OneXModder
:choiceeleven
call %FAQ%\CHANGELOG.bat
goto OneXModder
:choiceseven
@echo off
cls
cd %FASTBOOT_CHARGER%\
call Recharger.bat
goto OneXModder
:choicefive
cls
color 0a
title HTC One X Modder V1.0 -Status Connections-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /          Tool selected: Status Connections Verifer            /
echo   \                                                               \
echo   =================================================================
echo   Wait a few seconds... the adb server is starting...
echo.
cd %ADB_TOOLS%\
       adb start-server
echo.
echo   Done! Wait a few seconds...
ping -n 5 127.0.0.1 > nul
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /          Tool selected: Status Connections Verifer            /
echo   \                                                               \
echo   =================================================================
echo   -------------------------------------
echo   Adb Status:
cd %ADB_TOOLS%\
echo.
       adb devices
echo   -------------------------------------
echo   Fastboot status:
cd %ADB_TOOLS%\
echo.
       fastboot devices
echo   -------------------------------------
echo   Get all info about your phone:
cd %ADB_TOOLS%\
echo.
       fastboot getvar all
echo   -------------------------------------
echo   Press a key to return to the menu'...
pause>nul
goto OneXModder
:choiceonee
cls
title HTC One X Modder V1.0 -Bootloader Unlocker-
color 0c
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Bootloader unlocker.              /
echo   \                                                               \
echo   =================================================================
echo   This tool will unlock your bootloader.
echo   I'm not resopnsable for bricked devices, thermonuclear war
echo   or other damages to your pc/device.
echo   BACKUP YOUR DATA!! IF YOU UNLOCK YOUR BOOTLOADER,
echo   YOUR DATA WILL BE ERASED!
echo.
echo   -----------------------------------------------------------------
set /p blchoice=  Are you sure you want to unlock your bootloader? (Y/N)
if "%blchoice%" == "Y" goto blone
if "%blchoice%" == "N" goto OneXModder
if "%blchoice%" == "" goto blchoiceinvalid
:blchoiceinvalid
echo.
echo  Invalid Input. Press any key to retry...
pause>nul
goto choiceonee
:blone
cls
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Bootloader unlocker.              /
echo   \                                                               \
echo   =================================================================
echo.
cd %ADB_TOOLS%\
echo   -----------------------------------------------------------------
echo   Copy the code below and go on htcdev.com/bootloader/
echo   from "Identifer Token Start" (included) to
echo   "Identifer Token End (included)
echo   Then select "ALL OTHERS SUPPORTED MODELS",
echo   then copy and paste on the box the code below:
echo   -----------------------------------------------------------------
fastboot oem get_identifer_unlock
echo   -----------------------------------------------------------------
echo   A file named "Unlock_code.bin" will be sent on your
echo   email address. Download it, and place it into
echo   your system drive folder.
echo   When you have done, press any key.
echo   -----------------------------------------------------------------
pause>nul
goto bltwo
:bltwo
cls
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Bootloader unlocker.              /
echo   \                                                               \
echo   =================================================================
echo   Your device will be unlocked in a few seconds...
echo   Please wait...
if not exist %systemdrive%\Unlock_code.bin goto filenotexist
if exist %systemdrive%\Unlock_code.bin copy %systemdrive%\Unlock_code.bin %tempp%\
copy %ADB_TOOLS%\*.* %tempp%\
cd %tempp%\
fastboot flash unlock_token Unlock_code.bin
echo.
echo   Completed! Press any key to return to the menu...
goto OneXModder
:filenotexist
cls
title HTC One X Modder V1.0 -ERROR-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              ERROR: Unlock_code.bin not exist!!!              /
echo   \                                                               \
echo   =================================================================
echo   FATAL ERROR: Unlock_code.bin not exist in your system drive!
echo   Please check if exist. If yes, move them into your desktop.
echo   Then copy and paste this text into the cmd:
echo.
echo   [""copy %userprofile%\Desktop\Unlock_code.bin %systemdrive%\""]
echo.
echo   When you've done this step, press any key to retry...
pause>nul
goto bltwo
:choicetwo
cls
title HTC One X Modder V1.0 -Custom Recovery Flasher-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   =================================================================
set selectrecovery=
echo   This tool will flash a recovery you want. If you have other
echo   recoveries that are different from them shown below,
echo   if you want, contact me and i will add them!
echo.
echo   NOTES: REQUIRES BL UNLOCKED. REBOOT YOUR PHONE INTO
echo   HBOOT MODE.
echo.
echo   Select a recovery you want to flash:
echo   1) TWRP 2.8.0.0 EndeavorU (ADB,UMS SUPPORT) (NOT TESTED YET)
echo   2) ClockWorkMod EndeavorU Touch 6.0.4.8 (NOT TESTED YET)
echo   3) ClockWorkMod EndeavorU Old Layout 5.8.4.0 (All working)
echo   4) TWRP 2.8.1.0 EndeavorU Old Layout (All working)
echo   5) TWRP 2.8.5.3 EndeavorU New Layout (aka BiG, all working)
echo   6) HTC OneX 1.0 EndeavorU Stock Recovery (STOCK, NO MOD)
echo   7) Return back to menu'
echo.
set /p selectrecovery=  Please make a choice (ex. "1" without quotes):
if "%selectrecovery%" == "1" goto recone
if "%selectrecovery%" == "2" goto rectwo
if "%selectrecovery%" == "3" goto recthree
if "%selectrecovery%" == "4" goto recfour
if "%selectrecovery%" == "5" goto recfive
if "%selectrecovery%" == "6" goto recsix
if "%selectrecovery%" == "7" goto OneXModder
if "%selectrecovery%" == "" goto recinvalid
:recinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto choicetwo
:recsix
cls
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /             Recovery selected: HTC Stock Recovery             /
echo   \                                                               \
echo   /                Stock Recovery without any Mods.               /
echo   \                                                               \
echo   =================================================================
set recfinalsix=
set /p recfinalsix=  Are you sure you want to flash this recovery? (Y/N):
if "%recfinalone%" == "Y" goto recsixflash
if "%recfinalone%" == "N" goto choicetwo
if "%recfinalone%" == "" goto recsixinvalid
:recsixinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto recone
:recsixflash
cls
title HTC One X Modder V1.0 -Flashing...-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /             Recovery selected: HTC Stock Recovery             /
echo   \                                                               \
echo   /                Stock Recovery without any Mods.               /
echo   \                                                               \
echo   /        Flashing... DO NOT TOUCH THE USB CABLE OR THE PC!!     /
echo   \                                                               \
echo   =================================================================
copy %CUSTOM_RECOVERY%\TWRP_2.8.0.0_ENDEAVORU.img %tempp%\
cd %tempp%\
if not exist %tempp%\fastboot.exe copy %ADB_TOOLS%\*.* %tempp%\
fastboot flash recovery TWRP_2.8.0.0_ENDEAVORU.img
echo.
ping -n 6 127.0.0.1
cls
title HTC One X Modder V1.0 -Completed!-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /             Recovery selected: HTC Stock Recovery             /
echo   \                                                               \
echo   /                Stock Recovery without any Mods.               /
echo   \                                                               \
echo   /            Succesfully Flashed: htc_recovery.img!!            /
echo   \                                                               \
echo   =================================================================
echo    Completed! Press any key to return to the menu...
pause>nul
goto OneXModder
:recone
cls
title HTC One X Modder V1.0 -Recovery selected: TWRP 2.8.0.0 EndeavorU-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /            Recovery selected: TWRP 2.8.0.0 EndeavorU          /
echo   \                                                               \
echo   /              with ADB and UMS support. NOT TESTED.            /
echo   \                                                               \
echo   =================================================================
set recfinalone=
set /p recfinalone=  Are you sure you want to flash this recovery? (Y/N):
if "%recfinalone%" == "Y" goto reconeflash
if "%recfinalone%" == "N" goto choicetwo
if "%recfinalone%" == "" goto reconeinvalid
:reconeinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto recone
:reconeflash
cls
title HTC One X Modder V1.0 -Flashing...-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /            Recovery selected: TWRP 2.8.0.0 EndeavorU          /
echo   \                                                               \
echo   /              with ADB and UMS support. NOT TESTED.            /
echo   \                                                               \
echo   /        Flashing... DO NOT TOUCH THE USB CABLE OR THE PC!!     /
echo   \                                                               \
echo   =================================================================
copy %CUSTOM_RECOVERY%\TWRP_2.8.0.0_ENDEAVORU.img %tempp%\
cd %tempp%\
if not exist %tempp%\fastboot.exe copy %ADB_TOOLS%\*.* %tempp%\
fastboot flash recovery TWRP_2.8.0.0_ENDEAVORU.img
echo.
ping -n 6 127.0.0.1
cls
title HTC One X Modder V1.0 -Completed!-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /            Recovery selected: TWRP 2.8.0.0 EndeavorU          /
echo   \                                                               \
echo   /              with ADB and UMS support. NOT TESTED.            /
echo   \                                                               \
echo   /         Succesfully Flashed: TWRP_2.8.0.0_ENDEAVORU.IMG!!     /
echo   \                                                               \
echo   =================================================================
echo    Completed! Press any key to return to the menu...
pause>nul
goto OneXModder
:rectwo
cls
title HTC One X Modder V1.0 -Recovery selected: ClockWorkMod Touch 6.0.4.8-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /          Recovery selected: ClockWorkMod Touch 6.0.4.8        /
echo   \                                                               \
echo   /                ADB, UMS and Recovery NOT TESTED.              /
echo   \                                                               \
echo   =================================================================
set recfinalfour=
set /p recfinalfour=   Are you sure you want to flash this recovery? (Y/N)
if "%recfinalfour%" == "Y" goto recfourflash
if "%recfinalfour%" == "N" goto choicetwo
if "%recfinalfour%" == "" goto recfourinvalid
:recfourinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto recfour
:recfourflash
cls
title HTC One X Modder V1.0 -Flashing...-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /          Recovery selected: ClockWorkMod Touch 6.0.4.8        /
echo   \                                                               \
echo   /                ADB, UMS and Recovery NOT TESTED.              /
echo   \                                                               \
echo   /        Flashing... DO NOT TOUCH THE USB CABLE OR THE PC!!     /
echo   \                                                               \
echo   =================================================================
copy %CUSTOM_RECOVERY%\CLOCKWORK_TOUCH_6.0.4.8_ENDEAVORU.img %tempp%\
cd %tempp%\
if not exist %tempp%\fastboot.exe copy %ADB_TOOLS%\*.* %tempp%\
fastboot flash recovery CLOCKWORK_TOUCH_6.0.4.8_ENDEAVORU.img
echo.
echo   ...
ping -n 6 127.0.0.1
cls
title HTC One X Modder V1.0 -Completed!-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /          Recovery selected: ClockWorkMod Touch 6.0.4.8        /
echo   \                                                               \
echo   /                 ADB, UMS and Recovery NOT TESTED.             /
echo   \                                                               \
echo   / Succesfully Flashed: CLOCKWORK_TOUCH_6.0.4.8_ENDEAVORU.img!!  /
echo   \                                                               \
echo   =================================================================
echo    Completed! Press any key to return to the menu...
pause>nul
goto OneXModder
:recthree
cls
title HTC One X Modder V1.0 -Recovery selected: ClockWorkMod Old Layout 5.8.4.0-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /        Recovery selected: ClockWorkMod Old Layout 5.8.4.0     /
echo   \                                                               \
echo   /            ADB, UMS and Recovery TESTED. OLD LAYOUT!!         /
echo   \                                                               \
echo   =================================================================
set recfinalfour=
set /p recfinalfour=   Are you sure you want to flash this recovery? (Y/N)
if "%recfinalfour%" == "Y" goto recfiveflash
if "%recfinalfour%" == "N" goto choicetwo
if "%recfinalfour%" == "" goto recfiveinvalid
:recfiveinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto recfive
:recfiveflash
cls
title HTC One X Modder V1.0 -Flashing...-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /        Recovery selected: ClockWorkMod Old Layout 5.8.4.0     /
echo   \                                                               \
echo   /            ADB, UMS and Recovery TESTED. OLD LAYOUT!!         /
echo   \                                                               \
echo   /        Flashing... DO NOT TOUCH THE USB CABLE OR THE PC!!     /
echo   \                                                               \
echo   =================================================================
copy %CUSTOM_RECOVERY%\clockworkmod_5840_endeavoru_OldLayout.img %tempp%\
cd %tempp%\
if not exist %tempp%\fastboot.exe copy %ADB_TOOLS%\*.* %tempp%\
fastboot flash recovery clockworkmod_5840_endeavoru_OldLayout.img
echo   ...
ping -n 6 127.0.0.1
cls
title HTC One X Modder V1.0 -Completed!-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /        Recovery selected: ClockWorkMod Old Layout 5.8.4.0     /
echo   \                                                               \
echo   /            ADB, UMS and Recovery TESTED. OLD LAYOUT!!         /
echo   \                                                               \
echo   /Succesfully Flashed: clockworkmod_5840_endeavoru_OldLayout.img!/
echo   \                                                               \
echo   =================================================================
echo    Completed! Press any key to return to the menu...
pause>nul
goto OneXModder
:recfour
cls
title HTC One X Modder V1.0 -Recovery selected: TWRP 2.8.1.0 EndeavorU-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /            Recovery selected: TWRP 2.8.1.0 EndeavorU          /
echo   \                                                               \
echo   /           with ADB and UMS support. TESTED. OLD LAYOUT!!      /
echo   \                                                               \
echo   =================================================================
set recfinalone=
set /p recfinalone=  Are you sure you want to flash this recovery? (Y/N):
if "%recfinalone%" == "Y" goto recsixflash
if "%recfinalone%" == "N" goto choicetwo
if "%recfinalone%" == "" goto recsixinvalid
:recsixinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto recsix
:recsixflash
cls
title HTC One X Modder V1.0 -Flashing...-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /            Recovery selected: TWRP 2.8.1.0 EndeavorU          /
echo   \                                                               \
echo   /           with ADB and UMS support. TESTED. OLD LAYOUT!!      /
echo   \                                                               \
echo   /        Flashing... DO NOT TOUCH THE USB CABLE OR THE PC!!     /
echo   \                                                               \
echo   =================================================================
copy %CUSTOM_RECOVERY%\twrp2810_endeavoru_OldLayout.img %tempp%\
cd %tempp%\
if not exist %tempp%\fastboot.exe copy %ADB_TOOLS%\*.* %tempp%\
fastboot flash recovery twrp2810_endeavoru_OldLayout.img
echo.
ping -n 6 127.0.0.1
cls
title HTC One X Modder V1.0 -Completed!-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /            Recovery selected: TWRP 2.8.1.0 EndeavorU          /
echo   \                                                               \
echo   /           with ADB and UMS support. TESTED. OLD LAYOUT!!      /
echo   \                                                               \
echo   /      Succesfully Flashed: twrp2810_endeavoru_OldLayout.img!!  /
echo   \                                                               \
echo   =================================================================
echo    Completed! Press any key to return to the menu...
pause>nul
goto OneXModder
:recfive
cls
title HTC One X Modder V1.0 -Recovery selected: TWRP 2.8.5.3 EndeavorU-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /          Recovery selected: TWRP 2.8.5.3 EndeavorU BiG        /
echo   \                                                               \
echo   /           with ADB and UMS support. TESTED. NEW LAYOUT!!      /
echo   \                                                               \
echo   =================================================================
set recfinalone=
set /p recfinalone=  Are you sure you want to flash this recovery? (Y/N):
if "%recfinalone%" == "Y" goto recsevenflash
if "%recfinalone%" == "N" goto choicetwo
if "%recfinalone%" == "" goto recseveninvalid
:recseveninvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto recsix
:recsevenflash
cls
title HTC One X Modder V1.0 -Flashing...-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /          Recovery selected: TWRP 2.8.5.3 EndeavorU BiG        /
echo   \                                                               \
echo   /           with ADB and UMS support. TESTED. NEW LAYOUT!!      /
echo   \                                                               \
echo   /        Flashing... DO NOT TOUCH THE USB CABLE OR THE PC!!     /
echo   \                                                               \
echo   =================================================================
copy %CUSTOM_RECOVERY%\twrp2853-endeavoru-NewLayout.img %tempp%\
cd %tempp%\
if not exist %tempp%\fastboot.exe copy %ADB_TOOLS%\*.* %tempp%\
fastboot flash recovery twrp2853-endeavoru-NewLayout.img
echo.
ping -n 6 127.0.0.1
cls
title HTC One X Modder V1.0 -Completed!-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Custom Recovery Flasher            /
echo   \                                                               \
echo   /          Recovery selected: TWRP 2.8.5.3 EndeavorU BiG        /
echo   \                                                               \
echo   /           with ADB and UMS support. TESTED. NEW LAYOUT!!      /
echo   \                                                               \
echo   /      Succesfully Flashed: twrp2853-endeavoru-NewLayout.img!!  /
echo   \                                                               \
echo   =================================================================
echo    Completed! Press any key to return to the menu...
pause>nul
goto OneXModder
:recsix
REM da finire
:choicethree
cls
title HTC One X Modder V1.0 -Rooting process-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Root your device! (BETA)           /
echo   \                                                               \
echo   =================================================================
echo   This tool will help you to root your device.
echo   At the moment, the autoroot process is still in alpha.
echo   So, i can only guide you for rooting process.
echo.
set rootconfirmation=
set /p rootconfirmation=   Are you sure you want to root your device? (Y/N)
if "%rootconfirmation%" == "Y" goto rootprocess
if "%rootconfirmation%" == "N" goto OneXModder
if "%rootconfirmation%" == "" goto rootinvalid
:rootinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto choicethree
:rootprocess
cls
title HTC One X Modder V1.0 -Rooting process-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Root your device! (BETA)           /
echo   \                                                               \
echo   =================================================================
echo   Firstly, install a custom recovery. To do that:
echo   Reopen this tool in another window, unlock your bootloader
echo   (if you already have done that, skip the unlocking process),
echo   select the 2nd option (Custom recovery flasher) and
echo   flash a recovery. Then, via stock rom, copy/paste the supersu.zip
echo   When you have done that, press any key.
pause>nul
cls
title HTC One X Modder V1.0 -Rooting process-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Root your device! (BETA)           /
echo   \                                                               \
echo   =================================================================
set rootselect=
echo   Select a recovery you have installed:
echo   1) TWRP
echo   2) CWM/CWM Touch
set /p rootselect=   Type the number of the recovery you have installed:
if "%rootselect%" == "1" goto roottwrp
if "%rootselect%" == "2" goto rootcwm
if "%rootselect%" == "" goto rootselectinvalid
:rootselectinvalid
echo.
echo   Invalid input. Press any key to continue...
pause>nul
goto rootprocess
:roottwrp
cls
title HTC One X Modder V1.0 -Rooting process with TWRP-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Root your device! (BETA)           /
echo   \                                                               \
echo   =================================================================
echo   Follow this steps. If you encounter any issue,
echo   tell me on XDA (via OneX Modder thread, no via pm)
echo   1) Reboot your phone into your rom
echo   2) Copy/paste the supersu zip into your internal sd card
echo   3) Reboot your phone into TWRP
echo   4) Tap on "Install"
echo   5) Tap on your supersu zip and swipe to confirm
echo   5b) Optional: Clear dalvik and cache
echo   6) Tap on "Reboot your system". Enjoy!
echo.
echo   Congrats! You have rooted your system.
echo   Press any key to return to the menu'...
pause>nul
goto OneXModder
:rootcwm
cls
title HTC One X Modder V1.0 -Rooting process with CWM/CWM Touch-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /             Tool selected: Root your device! (BETA)           /
echo   \                                                               \
echo   =================================================================
echo   Follow this steps. If you encounter any issue,
echo   tell me on XDA (via OneX Modder thread, no via pm)
echo   1) Reboot your phone into your rom
echo   2) Copy/paste the supersu zip into your internal sd card
echo   3) Reboot your phone into CWM/CWM Touch
echo.
echo   If you are using CWM, follow the 4th step.
echo   If you are using CWM Touch, follow 5th step. Skip 4th step.
echo.
echo   4) With the volume buttons, select "Install a zip" and
echo   confirm with Power button. Then select Install from internal
echo   sd card, and select your supersu zip. Then select yes and reboot.
echo.
echo   5) Tap on install a zip, then tap on Install from sd card and
echo   tap on your supersu zip. Tap on yes and reboot.
echo.
echo   Congrats! You have rooted your system.
echo   Press a key to return to the menu'...
pause>nul
goto OneXModder
:choicefour
cls
title HTC One X Modder V1.0 -Flashing/Building a ROM-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /            Tool selected: Flash/Build a Custom ROM!           /
echo   \                                                               \
echo   =================================================================
echo   Please select a choice:
echo   1) Build a Custom ROM! (FOR LINUX USERS ONLY) (NOT AVAIBLE)
echo   2) Flash a Custom ROM! 
echo.
set romask=
set /p romask=   Please type your choice: 
if "%romask%" == "1" goto norom
if "%romask%" == "2" goto flashrom
if "%romask%" == "" goto romaskinvalid
:romaskinvalid
echo.
echo   Invalid Input. Press any key to retry...
pause>nul
goto choicefour
:norom
echo.
echo   Sorry, this section is under working. Please wait for new releases.
echo   Press a key to return to the menu...
pause>nul
goto OneXModder
:buildrom
cls
title HTC One X Modder V1.0 -Building a ROM-
color 0a
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Build a Custom ROM!               /
echo   \                                                               \
echo   =================================================================
echo   This tool will provide you an sh script that is completely
echo   manual and will build a custom rom for your One X.
echo   Each command is still on beta, so if there is any error
echo   on the process, please tell me, so I can fix it.
echo.
echo   Please select a script:
echo.
echo   1) Kali NetHunter (One X Version) (BETA SCRIPT)
echo   2) CyanogenMod 11 (BETA SCRIPT) (COMING SOON)
echo   3) CyanogenMod 12 (BETA SCRIPT) (COMING SOON)
echo   4) CyanogenMod 13 (BETA SCRIPT) (COMING SOON)
echo.
set builddecision=
set /p builddecision=   Please type your choice:
if "%builddecision%" == "1" goto buildkali
if "%builddecision%" == "2" goto buildcmoneone
if "%builddecision%" == "3" goto buildcmonetwo
if "%builddecision%" == "4" goto buildcmonethree
:buildkali
echo.
echo   Copying the build script on your system drive...
echo.
   copy %ROMBUILDER%\kali_nethunter.sh %systemdrive%\
echo.
echo   Done! Now, copy the build script on your USB drive,
echo   Boot linux and copy/paste on your term the commands 
echo   with administrator privileges
echo   or the script won't work. Good luck!
echo   Press a key to return to the menu...
pause>nul
goto OneXModder
:buildcmoneone
echo.
echo   Sorry, but this script doesn't exist.
echo   Press any key to return to the menu...
pause>nul
goto OneXModder
:buildcmonetwo
echo.
echo   Sorry, but this script doesn't exist.
echo   Press any key to return to the menu...
pause>nul
goto OneXModder
:buildcmonethree
echo.
echo   Sorry, but this script doesn't exist.
echo   Press any key to return to the menu...
pause>nul
goto OneXModder
:flashrom
cls
title HTC One X Modder V1.0 -Flashing a ROM-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Flash a Custom ROM!               /
echo   \                                                               \
echo   =================================================================
echo   This tool will help you to flash a Custom ROM listed below.
echo   Are you sure you want to flash a custom rom?
echo.
set romdecision=
set /p romdecision=   Please type your choice (Y/N)
if "%romdecision%" == "Y" goto romyes
if "%romdecision%" == "N" goto OneXModder
if "%romdecision%" == "" goto rominvalid
:rominvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto choicefour
:romyes
cls
title HTC One X Modder V1.0 -Flashing a ROM-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Flash a Custom ROM!               /
echo   \                                                               \
echo   =================================================================
echo   Now i will guide you on -How to flash a custom rom-.
echo   Do you want to apply:
echo   1) New Layout (ONLY IF YOU CURRENTLY ARE ON OLD LAYOUT)
echo   or
echo   2) Old layout (ONLY IF YOU CURRENTLY ARE ON NEW LAYOUT)
set romdecisiontwo=
set /p romdecisiontwo=   Please type your choice (ex. "1" without quotes):
if "%romdecisiontwo%" == "1" goto newlayout
if "%romdecisiontwo%" == "2" goto oldlayout
if "%romdecisiontwo%" == "" goto romtwoinvalid
:romtwoinvalid
echo.
echo   Invalid Input. Press a key to retry...
pause>nul
goto romyes
:newlayout
cls
title HTC One X Modder V1.0 -Flashing a ROM-SuperSized Layout-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Flash a Custom ROM!               /
echo   \                                                               \
echo   =================================================================
echo   Follow this steps, and firstly make a full backup.
echo   1) There is a guide (made by XDA-User:@teemo, thanks)
echo.
echo   Note: Each step is a simple image. It will called for ex.
echo   "step1" or similar. The Modder will open them for you.
echo.
echo   If you havent't flashed the New Layout recovery,
echo   reopen this tool, go to recovery flasher and select
echo   the TWRP 2.8.5.3 (aka BiG). Then wait and follow this
echo   steps on this images:
echo   Press a key to open 1st step...
pause>nul
cd %SUPERSIZED%\
step1.bmp
echo   Press a key to open 2nd step...
pause>nul
cd %SUPERSIZED%\
step2.bmp
echo   Press a key to open 3rd step...
pause>nul
cd %SUPERSIZED%\
step3.bmp
echo   Press a key to open 4th step...
pause>nul
cd %SUPERSIZED%\
step4.bmp
echo   Press a key to open 5th step...
pause>nul
cd %SUPERSIZED%\
step5.bmp
echo   Press a key to open the final step...
pause>nul
cd %SUPERSIZED%\
step6.bmp
cls
color 0e
title HTC One X Modder V1.0 -Flashing a ROM-SuperSized Layout-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Flash a Custom ROM!               /
echo   \                                                               \
echo   =================================================================
echo   When you have flashed your rom, put them into your system drive
echo   and rename it rom.zip . I will flash boot.img for you ;)
echo   Press a key when you are ready...
pause>nul
cd %ADB_TOOLS%\
fastboot reboot bootloader
ping -n 10 127.0.0.1 > nul
cd %SZ%\
call boot_extractor.bat
ping -n 20 127.0.0.1 > nul
cd %ADB_TOOLS%\
fastboot flash boot %systemdrive%\boot.img
echo   Completed! Press a key to return to the menu'...
pause>nul
goto OneXModder
:oldlayout
cls
title HTC One X Modder V1.0 -Flashing a ROM-Old Layout-
color 0e
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Flash a Custom ROM!               /
echo   \                                                               \
echo   =================================================================
echo   Follow this steps, and firstly make a full backup.
echo   1) There is a guide (made by XDA-User:@teemo, thanks)
echo.
echo   Note: Each step is a simple image. It will called for ex.
echo   "step1" or similar. The Modder will open them for you.
echo.
echo   If you havent't flashed the New Layout recovery,
echo   reopen this tool, go to recovery flasher and select
echo   the TWRP 2.8.1.0 Old Layout. Then wait and follow this
echo   steps on this images:
echo   Press a key to open 1st step...
pause>nul
cd %OLDSIZED%\
step1.bmp
echo   Press a key to open 2nd step...
pause>nul
cd %OLDSIZED%\
step2.bmp
echo   Press a key to open 3rd step...
pause>nul
cd %OLDSIZED%\
step3.bmp
echo   Press a key to open 4th step...
pause>nul
cd %OLDSIZED%\
step4.bmp
echo   Press a key to open the final step...
pause>nul
cd %OLDSIZED%\
step5.bmp
cls
color 0e
title HTC One X Modder V1.0 -Flashing a ROM-Old Layout-
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /              Tool selected: Flash a Custom ROM!               /
echo   \                                                               \
echo   =================================================================
echo   When you have flashed your rom, put them into your system drive
echo   and rename it rom.zip . I will flash boot.img for you ;)
echo   Press a key when you are ready...
pause>nul
cd %ADB_TOOLS%\
fastboot reboot bootloader
ping -n 10 127.0.0.1 > nul
cd %SZ%\
call boot_extractor.bat
ping -n 20 127.0.0.1 > nul
cd %ADB_TOOLS%\
fastboot flash boot %systemdrive%\boot.img
echo   Completed! Press a key to return to the menu'...
pause>nul
goto OneXModder
:choicenine
cls
color 0d
echo   =================================================================
echo   \                                                               \
echo   /                 Welcome to HTC One X Modder!                  /
echo   \                                                               \
echo   /                      About this program!                      /
echo   \                                                               \
echo   =================================================================
echo   This program is OpenSource. You're free to change the program
echo   code, but you can create damage on your pc/device. I will add
echo   three different version with your favourite colours! :D
echo   If you want a version translated on your language, and
echo   if you speak a good english, you can tell me about them
echo   and I will add your translated version!
echo   Please, don't repost in another forum without my permission.
echo.
echo   Special contributors:
echo   -----------------------------------------------------------------
echo   @teemo, for providing all stuff needed. Without him,
echo   this script not exist due to absent work material.
echo   -----------------------------------------------------------------
echo   Contributors:
echo   -----------------------------------------------------------------
echo   @pleomaxell for giving tips for the first stable release
echo   -----------------------------------------------------------------
echo   If any bug/error appear, please let me know via the OneX Modder
echo   thread! I can't offer help in pm.
echo   To return to the menu, press any key...
pause>nul
goto OneXModder