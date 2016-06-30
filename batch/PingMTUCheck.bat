rem Ping address and confirm MTU is not set to high (packet broken into many pieces)

ping 172.16.30.4 -f -l 14000

rem if the result is (Packet needs to be fragmented but DF set.) you may have issues with services such as RDP over VPN.

pause