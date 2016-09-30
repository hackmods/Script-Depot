$ipaddy = Get-WmiObject Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName . 
$name =  hostname
#create file
out-file "C:\temp\dump.txt"
# if $name already exists, don't wirte, otherwise write IP and hostname.
if 
 (Get-Content "c:\temp\dump.txt" | Select-String hostname) {
  exit
  } else {
   out-file "C:\temp\dump.txt" -inputobject $name,$ipaddy -append -width 200
  }
