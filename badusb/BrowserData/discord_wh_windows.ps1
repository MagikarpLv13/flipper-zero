Start-Process notepad.exe -Wait

Start-Sleep -Seconds 2

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('salut')

