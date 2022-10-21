# Initializes Oh My Posh and sets my theme
oh-my-posh init pwsh --config 'https://gist.githubusercontent.com/aryanprince/93710640e69d3fd16bb10e66f16b7ae3/raw/3b22d4ffa46b3646e2b04214aaf6ce19179ea63c/takuya.omp.json' | Invoke-Expression

# PSReadLine for smart automagic features
if ($host.Name -eq 'ConsoleHost')
{
    Import-Module PSReadLine
}
# Command history shown in autocomplete style
Set-PSReadLineOption -PredictionSource History
# Not sure about predective list view cus can be distracting
#Set-PSReadLineOption -PredictionViewStyle ListView

# Shortcut for delete char
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# No annoying 'tings'
Set-PSReadLineOption -BellStyle None

# Fuzzy search
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Not sure what 1st and 2nd lines do but third one does bash style autocompletion
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
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

# Loads neat icons for different file types on the terminal (but adds about 800ms to load times)
Import-Module -Name Terminal-Icons


# Custom Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
