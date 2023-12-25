# Ouvre le Bloc-notes
Start-Process notepad.exe -Wait

# Pause pour laisser le Bloc-notes s'ouvrir complètement
Start-Sleep -Seconds 2

# Écrit "salut" dans le Bloc-notes
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.SendKeys]::SendWait('salut')

