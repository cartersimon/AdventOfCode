## Advent of Code 2021 - Day 3 - Part 1

$report = Get-Content .\input.txt
$gamma = "" # most common bit in each position
$epsilon = "" # least common bit in each position

$size = $report[0].Length

$bit0 = @()
$bit1 = @()
$bit2 = @()
$bit3 = @()
$bit4 = @()

for ( $i = 0 ; $i -lt $size ; $i++ ){
    $ZeroCount = 0
    $OneCount = 0

    foreach ( $line in $report ) {
        if ( $line[$i] -eq "0" ) { $ZeroCount++ }
        else { $OneCount++ }
    }

    if ( $ZeroCount -gt $OneCount ) { $gamma += 0 ; $epsilon += 1 }
    else { $gamma += 1 ; $epsilon += 0 }

}

return [Convert]::ToInt32($gamma,2) * [Convert]::ToInt32($epsilon,2)