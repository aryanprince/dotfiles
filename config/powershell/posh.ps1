# Initializes Oh My Posh and sets my theme
oh-my-posh init pwsh --config "$(scoop prefix oh-my-posh)\themes\takuya.omp.json" | Invoke-Expression

# Loads neat icons for different file types on the terminal (but adds about 800ms to load times)
Import-Module -Name Terminal-Icons

# Custom Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias pn pnpm