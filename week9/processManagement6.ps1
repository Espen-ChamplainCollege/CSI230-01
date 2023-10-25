$chrome= Get-Process | Where-Object { $_.ProcessName -eq "chrome" }

if ($chrome -eq $null){
    Start-Process "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.champlain.edu"
}

else{
    Stop-Process -Name "chrome" 
}