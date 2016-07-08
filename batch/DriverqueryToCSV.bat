rem List PC drivers and output to CSV file

driverquery /FO CSV /V  > drivers.csv

rem Remotely aquire drivers
rem driverquery /s MyPC /U domain\admin /P Password /FO CSV /V  > drivers.csv