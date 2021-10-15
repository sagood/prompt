#if ($host.UI.RawUI.WindowTitle -match "Administrator") {$host.UI.RawUI.BackgroundColor = "DarkRed"; $Host.UI.RawUI.ForegroundColor = "White"}
Import-Clixml C:\Users\GrYuT\Documents\WindowsPowerShell\common_commands.xml | Add-History

function prompt { 
    $prompt = Write-Prompt "# " -ForegroundColor ([System.ConsoleColor]::Red)
    $prompt += Write-Prompt $env:USERNAME -ForegroundColor ([System.ConsoleColor]::Cyan)
    $prompt += Write-Prompt " in "
    $prompt += & $GitPromptScriptBlock
    $Date = Get-Date
	$prompt += Write-Prompt " "
	$prompt += $Date.ToString()
    $newLine = [Environment]::NewLine
	$prompt += Write-Prompt $newLine
	$prompt += Write-Prompt ">" -ForegroundColor ([System.ConsoleColor]::Magenta)

    if ($prompt) { "$prompt " } else { " " }
}
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


Import-Module PSReadLine
Import-Module posh-git
Import-Module PSFzf

Set-PSReadlineOption -BellStyle None
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{ InlinePrediction = '#2F7004'}
#Set-PSReadLineOption -Colors @{ InlinePrediction = "$([char]0x1b)[36;7;238m"}
# Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias -Name fgs -Value Invoke-FuzzyGitStatus