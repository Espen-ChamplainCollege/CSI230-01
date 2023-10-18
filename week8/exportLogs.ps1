Get-EventLog -list

$log = Read-Host -Prompt "Input a log to review"

Get-EventLog -LogName $log | export-csv -NoTypeInformation -Path "$PSScriptRoot/logExport.csv"