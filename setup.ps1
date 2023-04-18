# Install Scoop, confirm with A
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
iwr -useb get.scoop.sh | iex
# irm get.scoop.sh | iex

# Preparation
scoop install git
scoop bucket add extras

# CLI tools
scoop install nvm
scoop install pnpm
scoop install yarn
scoop install oh-my-posh
scoop install pyenv

# GUI tools
scoop install github
scoop install vscode

# Regular Apps
scoop install figma
scoop install fsviewer
scoop install powertoys
scoop install vlc
scoop install windows-terminal
scoop install windows-terminal-preview
# scoop install bandizip # Bandizip portable doesn't include context menu options
# scoop install discord # Installs an ugly portable Discord (
# scoop install spotify # No Xbox Game Bar integration
# scoop install whatsapp # Not the new native WhatsApp with Win11 UI

# Temporary uni tools
scoop install r
scoop install rtools
scoop install rstudio
scoop install android-studio

# Winget apps
winget install 9NKSQGP7F2NH # WhatsApp
winget install XPDCFJDKLZJLP8 # Visual Studio 2022
winget install 9P2W3W81SPPB # Bandizip
winget install XPDC2RH70K22MN # Discord
winget install Microsoft.PowerShell # PowerShell
winget install Microsoft.WindowsTerminal # Terminal
winget install Microsoft.WindowsTerminal.Preview # Terminal Preview
winget install Nvidia.GeForceExperience # GeForce Experience

# Other apps (not available with Scoop / Winget)
# 1Password - Password Manager
# Cron - Calendar
# Spark - Mail
# VSCode Insiders - for the right click context menu, hopefully comes to stable