@ECHO OFF
REM A mongodb startup script

echo "Initiate MongoDB service: Mongod"
cd "C:\Program Files\MongoDB\Server\3.4\bin"
start cmd /k mongod --port 27017
REM start cmd /k mongod --dbpath "C:\Program Files\MongoDB\data" --logappend --port 27017

echo "Waiting 5 seconds for server to initialize its statefulness..."
timeout /t 5

echo "Initiate MongoDB terminal: Mongo"
start cmd /k mongo.exe


