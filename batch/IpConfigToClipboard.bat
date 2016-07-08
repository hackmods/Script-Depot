@echo off
setlocal

ipconfig /all | clip

set "getclip=cscript /nologo /e:JScript "%~f0""

echo %getclip%

pause