chcp 65001 >nul
@echo off
color 0A
title ToMsPro CMD - Anti Kendor

:awal
cls
echo ╔═══════════════════════════════════════╗
echo ║        ToMsPro Toolkit v1.0           ║
echo ║       CMD Edition - Anti Kendor       ║
echo ╚═══════════════════════════════════════╝

:menu_utama
color 0A
echo.
echo ╔═══════════════════════════════════════╗
echo ║           MENU UTAMA                  ║
echo ╚═══════════════════════════════════════╝
echo 1. Cek Jaringan (Ping / Tracert)
echo 2. Tools Anti Kendor (Flush DNS / Cache)
echo 3. Aktivasi Office
echo 4. Keluar
echo.
set /p main_choice=Masukkan pilihan Anda (1-4): 

if %main_choice%==1 goto cek_jaringan
if %main_choice%==2 goto anti_kendor
if %main_choice%==3 goto panggil_powershell
if %main_choice%==4 goto keluar
goto menu_utama

:cek_jaringan
cls
color 0B
echo ================================
echo      MENU CEK JARINGAN
echo ================================
echo 1. Ping
echo 2. Tracert
echo 3. Kembali ke menu utama
echo.
set /p choice=Masukkan pilihan Anda (1-3): 

if %choice%==1 goto ping
if %choice%==2 goto tracert
if %choice%==3 goto menu_utama
goto cek_jaringan

:ping
cls
echo.
set /p target=Masukkan alamat IP atau domain untuk ping: 
ping %target%
pause
goto cek_jaringan

:tracert
cls
echo.
set /p target=Masukkan alamat IP atau domain untuk tracert: 
tracert %target%
pause
goto cek_jaringan

:anti_kendor
cls
color 0E
echo ================================
echo       TOOLS ANTI KENDOR
echo ================================
echo 1. Flush DNS              
echo 2. Sikat File Cache + Hapus Chrome Data   
echo 3. Kembali ke menu utama
echo.
set /p pil=Masukkan pilihan (1-3): 

if %pil%==1 goto DNS
if %pil%==2 goto Sikat
if %pil%==3 goto menu_utama
goto anti_kendor

:DNS
cls
color 0C
echo Menjalankan Flush DNS...
echo =======================================================
netsh winsock reset
netsh int ip reset
netsh advfirewall reset
ipconfig /flushdns
ipconfig /release
ipconfig /renew
echo =======================================================
echo SEMOGA WEEEDEEE
pause
goto anti_kendor

:Sikat
cls
color 0D
echo Menjalankan Cleaner...
echo =======================================================
taskkill /f /im chrome.exe
taskkill /f /im VpnSvc.exe
taskkill /f /im runtimebroker.exe
timeout 3
c:\windows\system32\cleanmgr.exe /c /sagerun:11
del /f /s /q %windir%\temp & md %windir%\temp  
del /f /s /q %userprofile%\recent\*.*  
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"  
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"  
del /f /s /q %userprofile%\recent\*.*  
del /f /s /q %systemdrive%\*.tmp  
del /f /s /q %systemdrive%\*._mp  
del /f /s /q %systemdrive%\*.log  
del /f /s /q %systemdrive%\*.gid  
del /f /s /q %systemdrive%\*.chk  
del /f /s /q %systemdrive%\*.old  
del /f /s /q %systemdrive%\recycled\*.*  
rd /s /q %windir%\temp & md %windir%\temp
rd /s /q %USERPROFILE%\AppData\Local\Google\Chrome
del /f /s /q %windir%\*.bak  
del /f /s /q %windir%\prefetch\*.* 
echo =======================================================
echo Done! Semoga WEEEDEEE ^^
echo Jalankan CCleaner Biar makin Bersih
pause
goto anti_kendor

:panggil_powershell
cls
color 0F
echo Membuka PowerShell dan menjalankan aktivator Office...
echo.
powershell -ExecutionPolicy Bypass -Command "cd C:\Windows\System32; irm https://get.activated.win | iex"
pause
goto menu_utama

:keluar
cls
color 0A
echo ===============================
echo Terima kasih telah menggunakan
echo           ToMsPro 
echo ===============================
pause
exit
