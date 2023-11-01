cd $PSScriptRoot\..

$files = Get-ChildItem -Recurse -Filter "*.bash"

for ($i=0; $i -lt $files.Length; $i++){
    $files[$i] | Get-Content | Measure-Object -Word -Line
}
