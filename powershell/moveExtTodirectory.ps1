clear

#Variables to various environment paths
$myDl = [Environment]::GetFolderPath("UserProfile") + "/downloads"
$myVid = [Environment]::GetFolderPath("myvideos")
$myMusic = [Environment]::GetFolderPath("mymusic")
$myDocs = [Environment]::GetFolderPath("mydocuments")

cd $myDl

#User input
$userInput = Read-Host -Prompt "Download Items Menu:`n1.  Music`n2.  Videos`n3.  Documents`n`nWhich files do you want to move?"

#Menu choices
if ($userInput -eq 1) {
    $ext = "mp3"
    $moveTo = $myMusic


} elseif ($userInput -eq 2) {
    $moveTo = $myVid
    $ext = "mp4"

} elseif ($userInput -eq 3) {
    $moveTo = $myDocs
    $ext = "docx"

} else {
  Write-Host "You have chosen an invalid selection."
  cd $myDl
}

$countIt = (Get-ChildItem $myDl -filter "*.$ext").Count

if ($countIt -lt 0) {

Write-Host "No more $ext files in the downloads to move"
} else {

Write-Host "Moved $countIt $ext files"
}

mv "*.$ext" $moveTo
