# --- INITIALIZE ---
# Initializes Oh My Posh and sets my theme
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/takuya.omp.json" | Invoke-Expression

# --- BASIC CUSTOMIZATION ---
# Loads neat icons for different file types on the terminal (but adds about 800ms to load times)
Import-Module -Name Terminal-Icons

# Custom Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias pn pnpm

# --- ADDITIONAL STUFF ---
# Zoxide - for faster directory navigation
Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell | Out-String)
})

# PSReadLine - for smart automagic features
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
# Command history shown in autocomplete style
Set-PSReadLineOption -PredictionSource History
# Shortcut for delete char
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
# No annoying 'tings'
Set-PSReadLineOption -BellStyle None
# Tab completion for folders (eg: cd <tab> will autocomplete to cd Documents)
Set-PSReadLineKeyHandler -Key Tab -Function Complete

# Adds automatic paired quotes
Set-PSReadLineKeyHandler -Chord '"',"'" `
                        -BriefDescription SmartInsertQuote `
                        -LongDescription "Insert paired quotes if not already on a quote" `
                        -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($line.Length -gt $cursor -and $line[$cursor] -eq $key.KeyChar) {
        # Just move the cursor
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
    }
    else {
        # Insert matching quotes, move cursor to be in between the quotes
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
    }
}

# Fuzzy search
# Import-Module PSFzf
# Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Commented out cus this shit is distracting
# Set-PSReadLineOption -PredictionViewStyle ListView