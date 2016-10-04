@echo off
REM Create the needed files
echo > .\7B296FB0-376B-497e-B012-9C450E1B7327-5P-0.C7483456-A289-439d-8115-601632D005A0
echo > .\7B296FB0-376B-497e-B012-9C450E1B7327-5P-1.C7483456-A289-439d-8115-601632D005A0

set skms=Research1.cfav.nc.com

for %%i in (. . . . . . . . . . . . . . . . . . . . . . . . . .) do call :Act %skms%

slmgr /ato

net stop sppsvc

goto :end

:Act

net stop sppsvc

timeout /T 2

del "%systemroot%\system32\7B296FB0-376B-497e-B012-9C450E1B7327-5P-0.C7483456-A289-439d-8115-601632D005A0" /F
del "%systemroot%\system32\7B296FB0-376B-497e-B012-9C450E1B7327-5P-1.C7483456-A289-439d-8115-601632D005A0" /F

xcopy "7B296FB0-376B-497e-B012-9C450E1B7327-5P-0.C7483456-A289-439d-8115-601632D005A0" "%systemroot%\System32\*" /H /R /K /Y /C
xcopy "7B296FB0-376B-497e-B012-9C450E1B7327-5P-1.C7483456-A289-439d-8115-601632D005A0" "%systemroot%\System32\*" /H /R /K /Y /C

net start sppsvc

timeout /T 2

cscript.exe "%systemroot%\system32\slmgr.vbs" /skms %1

cscript.exe "%systemroot%\system32\slmgr.vbs" /ipk MRPKT-YTG23-K7D7T-X2JMM-QY7MG

cscript.exe "%systemroot%\system32\slmgr.vbs" /ato

REM net stop sppsvc

:end
