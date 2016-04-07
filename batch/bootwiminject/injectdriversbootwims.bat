imagex /mountrw C:\temp\winpe\x86\winpe.wim 1 C:\temp\winpe\x86\mount
copy /y E:\batches\mapdrive.hta C:\temp\winpe\x86\mount\
copy /y E:\batches\mapdrive.hta C:\temp\winpe\x86\mount\Windows\System32\
Dism /image:C:\temp\winpe\x86\mount /Add-Package /PackagePath:"D:\Installed\Applications\AIK\Tools\PETools\x86\WinPE_FPs\winpe-hta.cab"
Dism /image:C:\temp\winpe\x86\mount /Add-Package /PackagePath:"D:\Installed\Applications\AIK\Tools\PETools\x86\WinPE_FPs\winpe-scripting.cab"
Dism /image:C:\temp\winpe\x86\mount /Add-Package /PackagePath:"D:\Installed\Applications\AIK\Tools\PETools\x86\WinPE_FPs\winpe-wmi.cab"
dism /image:C:\temp\winpe\x86\mount /add-driver /driver:c:\temp\winpe\drivers\x86 /recurse
imagex /unmount /commit C:\temp\winpe\x86\mount

imagex /mountrw C:\temp\winpe\amd64\winpe.wim 1 C:\temp\winpe\amd64\mount
copy /y E:\batches\mapdrive.hta C:\temp\winpe\amd64\mount\
copy /y E:\batches\mapdrive.hta C:\temp\winpe\amd64\mount\Windows\System32\
Dism /image:C:\temp\winpe\amd64\mount /Add-Package /PackagePath:"D:\Installed\Applications\AIK\Tools\PETools\amd64\WinPE_FPs\winpe-hta.cab"
Dism /image:C:\temp\winpe\amd64\mount /Add-Package /PackagePath:"D:\Installed\Applications\AIK\Tools\PETools\amd64\WinPE_FPs\winpe-scripting.cab"
Dism /image:C:\temp\winpe\amd64\mount /Add-Package /PackagePath:"D:\Installed\Applications\AIK\Tools\PETools\amd64\WinPE_FPs\winpe-wmi.cab"
dism /image:C:\temp\winpe\amd64\mount /add-driver /driver:c:\temp\winpe\drivers\amd64 /recurse
imagex /unmount /commit C:\temp\winpe\amd64\mount