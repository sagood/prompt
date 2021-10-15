Function Set-PsConsole 
{ 
 Set-Location -Path c:\ 
 # $host.ui.RawUI.ForegroundColor = "black" 
 # $host.ui.RawUI.BackgroundColor = "gray" 
 $maxWS = $host.UI.RawUI.Get_MaxWindowSize() 
 $ws = $host.ui.RawUI.WindowSize 
 IF($maxws.width -ge 85) 
   { $ws.width = 85 } 
 ELSE { $ws.height = $maxws.height } 
 IF($maxws.height -ge 42) 
   { $ws.height = 42 } 
 ELSE { $ws.height = $maxws.height } 
 $host.ui.RawUI.Set_WindowSize($ws) 
 $host.PrivateData.ErrorBackgroundColor = "white" 
 $Host.PrivateData.WarningBackgroundColor = "white" 
 $Host.PrivateData.VerboseBackgroundColor = "white" 
 $host.PrivateData.ErrorForegroundColor = "red" 
 $host.PrivateData.WarningForegroundColor = "DarkGreen" 
 $host.PrivateData.VerboseForegroundColor = "DarkBlue" 
} #end function Set-PsConsole

# **** Entry Point ***
Set-PsConsole
set-location d:\tfs
Start-Transcript
start-sleep 1
clear-host

$MaximumHistoryCount = 1KB

if (!(Test-Path ~\PowerShell -PathType Container))
{   New-Item ~\PowerShell -ItemType Directory
}

function bye
{   Get-History -Count 1KB |Export-CSV ~\PowerShell\history.csv
    exit
}

if (Test-path ~\PowerShell\History.csv)
{   Import-CSV ~\PowerShell\History.csv |Add-History
}

if ($host.UI.RawUI.WindowTitle -match "Administrator") {$host.UI.RawUI.BackgroundColor = "DarkRed"; $Host.UI.RawUI.ForegroundColor = "White"}