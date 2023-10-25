Get-Process | Select-Object ProcessName, StartTime | Where-Object { $_.ProcessName -ilike "C*" } | Where-Object { $_.StartTime -ge (Get-Date '11:30') }

#no processes started in the last hour, so just filtering before the most recent start time