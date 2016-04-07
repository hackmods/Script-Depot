echo off

REM To rearm a computer with a new CMID uncomment the line bellow
REM cscript //B slmgr.vbs /rearm

REM This part is for computers without a KMS public key
REM Set KMS public key
cscript //B slmgr.vbs /ipk 33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
REM Activate key to set Key in Computer | May fail due to DNS but its okay]
cscript //B slmgr.vbs /ato

REM Set KMS server to IP address or name of KMS server (v11aKMS)
cscript //B slmgr.vbs /skms 172.31.1.3
REM Activate License
cscript //B slmgr.vbs /ato