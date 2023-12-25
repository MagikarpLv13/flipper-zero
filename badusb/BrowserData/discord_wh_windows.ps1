# Spécifiez l'URL du fichier à télécharger
$url = "https://example.com/votre-fichier.exe"

# Spécifiez le chemin de destination pour le téléchargement
$destination = "C:\Chemin\Vers\Votre\Repertoire\votre-fichier.exe"

# Télécharge le fichier depuis l'URL spécifiée
Invoke-WebRequest -Uri $url -OutFile $destination

# Exécute le fichier téléchargé
Start-Process -FilePath $destination -Wait
