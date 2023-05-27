# Install Scoop
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex

# Preparation
scoop install main/git
scoop bucket add extras

# CLI tools
scoop install main/nvm
scoop install main/pnpm
scoop install main/yarn
scoop install main/oh-my-posh
scoop install main/pyenv
scoop install main/yt-dlp
scoop install main/gh

# Portable Apps
scoop install extras/github
scoop install extras/throttlestop
scoop install extras/webtorrent
scoop install extras/fsviewer
scoop install extras/autohotkey
scoop install extras/vlc

# Winget apps
winget install AgileBits.1Password
winget install Bandisoft.Bandizip 
winget install Discord.Discord 
winget install Figma.Figma 
winget install Readdle.Spark
winget install Notion.Notion
winget install WhatsApp.WhatsApp 

winget install Microsoft.VisualStudio.2022.Community 
winget install Microsoft.PowerShell 
winget install Microsoft.WindowsTerminal 
winget install Microsoft.PowerToys
winget install Nvidia.GeForceExperience

# Other apps (not available with Scoop / Winget)
# Cron - Calendar app

# Temporary uni tools
# scoop install r
# scoop install rtools
# scoop install rstudio
# scoop install android-studio