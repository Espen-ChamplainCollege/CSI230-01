﻿Get-Service | Where-Object { $_.Status -ilike "Stopped" } | Sort-Object Name | Export-Csv -Path "$PSScriptRoot/processManagement3.csv"