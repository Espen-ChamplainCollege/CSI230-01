#(Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike Ethernet).IPAddress

#(Get-NetIPAddress -AddressFamily IPv4 | where InterfaceAlias -ilike Ethernet).PrefixLength

#Get-WmiObject -list | where { $_.Name -ilike "Win32_Net*" } | sort

#Get-CimInstance Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | select DHCPServer | Format-Table -HideTableHeaders

#(Get-DnsClientServerAddress -AddressFamily IPv4 | where InterfaceAlias -ilike Ethernet).ServerAddresses[0]

#cd $PSScriptRoot/../week8

#$files=(Get-ChildItem)

#for ($j=0; $j -le $files.Length; $j++){
   # if ($files[$j].Name -ilike "*ps1"){
    #    Write-Host $files[$j].Name
    #}
#}

#$folderpath="$PSScriptRoot\outfolder"

#if (Test-Path $folderpath){
#    Write-Host "Folder Already Exists"
#}
#else{
#    New-Item -ItemType Directory -Path $folderpath
#}

#cd $PSScriptRoot/../week8

#$files=(Get-ChildItem)

#$filepath="$PSScriptRoot/outfolder/out.csv"

#$files | Where { $_.Extension -eq ".ps1" } | Export-Csv -Path $filepath

$files=Get-ChildItem -Recurse -File

$files | Rename-Item -NewName { $_.Name -replace '.csv', '.log' }

Get-ChildItem -Recurse -File