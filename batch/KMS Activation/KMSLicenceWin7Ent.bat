REM Set the computers key to a sample KMS key (below key in Win 7 Entr)
slmgr.vbs /ipk 33PXH-7Y6KF-2VJC9-XBBR8-HVTHH
REM Test MKS (may fail)
slmgr.vbs /ato
REM Set KMS server by name or IP (name = V11aKMS IP = 172.31.1.3)
slmgr.vbs /skms 172.31.1.3
REM Activate your key against the KMS
slmgr.vbs /ato