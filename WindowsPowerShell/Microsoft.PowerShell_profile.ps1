# if ($host.UI.RawUI.WindowTitle -match "Administrator") {$host.UI.RawUI.BackgroundColor = "DarkRed"; $Host.UI.RawUI.ForegroundColor = "White"}
Import-Clixml C:\Users\GrYuT\Documents\WindowsPowerShell\common_commands.xml | Add-History

function prompt { 
	$Date = Get-Date 
	Write-Host 
	Write-Host "# " -NoNewline -ForegroundColor Red 
	Write-Host $env:USERNAME -NoNewline -ForegroundColor Cyan 
	Write-Host " in " -NoNewline 
	Write-Host $pwd" " -NoNewline -ForegroundColor Green 
             Write-VcsStatus
	Write-Host " "$Date 
	Write-Host ">" -NoNewline -ForegroundColor Magenta 	
	return " " 
}
# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module PSReadLine
Import-Module posh-git
# Import-Module TabExpansionPlusPlus

Set-PSReadlineOption -BellStyle None