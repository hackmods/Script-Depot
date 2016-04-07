REM Uninstall all language packs and dont reboot

REM sc config servicename start= disabled 
REM use name in task manager for the service name. Match description to service in msconfig
REM Values with spaces require quotes on the key and the value path or name

Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "RtHDVCpl" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "IgfxTray" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "HotKeysCmds" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "Persistence" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "RoxWatchTray" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "Acrobat Assistant 8.0" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "Adobe ARM" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "APSDaemon" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "Desktop Disc Tool" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "PDVDDXSRV" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "QuickTime Task" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "RoxWatchTray" /f
Reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run" /v "SunJavaUpdateSched" /f

REM VmWare
sc config "wsnm" start= disabled
REM Vmware USB
sc config "wsnm_usbctrl" start= disabled
REM Intel Clock
sc config "cphs" start= disabled
REM Intel DRM
sc config "ICCS" start= disabled
REM Autodesk but not flexnet
sc config "Autodesk Content Service" start= disabled
REM Roxio
sc config "RoxMediaDB12OEM" start= disabled
REM Google update
sc config "gupdate" start= disabled
sc config "gupdatem" start= disabled
REM Mozilla
sc config "MozillaMaintenance" start= disabled
REM Adobe
sc config "AdobeARMservice" start= disabled
sc config "AdobeFlashPlayerUpdateSvc" start= disabled

REM Delete CBS directory contents
del %SYSTEM%\Windows\Logs\CBS\*.* /s /q


lpksetup /u ar-SA bg-BG zh-HK zh-CN zh-TW hr-HR cs-CZ da-DK nl-NL et-EE fi-FI fr-FR de-DE el-GR he-IL hu-HU it-IT ja-JP ko-KR lv-LV lt-LT nb-NO pl-PL pt-BR pt-PT ro-RO ru-RU sr-Latn-CS sk-SK sl-SI es-ES sv-SE th-TH tr-TR uk-UA /r

rem Clean LOGS
reg add "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{44BBA840-CC51-11CF-AAFA-00AA00B6015C}" /v IsInstalled /t REG_DWORD /d 0 /f
reg delete "HKLM\SOFTWARE\Microsoft\Active Setup\Installed Components\{44BBA840-CC51-11CF-AAFA-00AA00B6015C}" /v StubPath /f

openfiles >nul 2>&1

DEL /S /F /Q "%temp%\*" 1>nul 2>nul
DEL /S /F /Q %systemroot%\temp\* 1>nul 2>nul
DEL /S /F /Q %systemroot%\inf\*.log 1>nul 2>nul
DEL /S /F /Q %systemroot%\Logs\CBS\* 1>nul 2>nul
DEL /S /F /Q %systemroot%\Logs\DPX\* 1>nul 2>nul
DEL /S /F /Q %systemroot%\Logs\DISM\* 1>nul 2>nul
DEL /S /F /Q %systemroot%\Microsoft.NET\Framework\v2.0.50727\*.log 1>nul 2>nul
DEL /S /F /Q %systemroot%\Microsoft.NET\Framework\v4.0.30319\*.log 1>nul 2>nul
if exist %systemroot%\SysWOW64\cmd.exe DEL /S /F /Q %systemroot%\Microsoft.NET\Framework64\v2.0.50727\*.log 1>nul 2>nul
if exist %systemroot%\SysWOW64\cmd.exe DEL /S /F /Q %systemroot%\Microsoft.NET\Framework64\v4.0.30319\*.log 1>nul 2>nul
DEL /S /F /Q %systemroot%\SoftwareDistribution\Download\* 1>nul 2>nul
RD /S /Q "%LocalAppData%\Microsoft\Windows\WER\ReportQueue" 1>nul 2>nul
for /f %%i in ('"dir /s /b /ad "%temp%"" 2^>nul') do RD /S /Q %%i 1>nul 2>nul
for /f %%i in ('"dir /s /b /ad %windir%\SoftwareDistribution\Download" 2^>nul') do RD /S /Q %%i 1>nul 2>nul
for /f %%i in ('"dir /s /b /ad %windir%\temp" 2^>nul') do RD /S /Q %%i 1>nul 2>nul

rem Disable customer experience improvement program
Reg ADD "HKLM\Software\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f

rem disable Customer Experience Improvement Program tasks
schtasks /change /tn "microsoft\windows\Application Experience\AitAgent" /disable
schtasks /change /tn "microsoft\windows\Application Experience\ProgramDataUpdater" /disable
schtasks /change /tn "microsoft\windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /change /tn "microsoft\windows\Customer Experience Improvement Program\KernelCeipTask" /disable
schtasks /change /tn "microsoft\windows\Customer Experience Improvement Program\UsbCeip" /disable

rem Activate Office (just to be safe)
if exist "c:\Program Files (x86)\" goto 64BIT

:32BIT
cscript "c:\Program Files\Microsoft Office\Office15\ospp.vbs" /act
goto END

:64BIT
cscript "c:\Program Files (x86)\Microsoft Office\Office15\ospp.vbs" /act
:END