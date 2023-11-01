﻿Get-ChildItem -File | Where-Object { $_.CreationTime -ge "10/24/2023" } | Select-Object CreationTime, Name | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | Set-Content "$PSScriptRoot\processManagement5.csv"