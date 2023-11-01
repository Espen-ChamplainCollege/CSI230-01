$possibleInputs = @('all', 'stopped', 'running')

$input = ""

while ($input -ine 'quit'){
    if ($possibleInputs -icontains $input){
        if ($input -ieq $possibleInputs[0]){
            Get-Service
        }
        if ($input -ieq $possibleInputs[1]) {
            Get-Service | Where-Object { $_.Status -ilike $possibleInputs[1] }
        }
        if ($input -ieq $possibleInputs[2]) {
            Get-Service | Where-Object { $_.Status -ilike $possibleInputs[2] }
        }
    }

    $input = Read-Host -Prompt "Type 'all', 'stopped', or 'running' to view respective services. Type 'quit' to stop"
}