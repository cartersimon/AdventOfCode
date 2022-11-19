## Advent of Code 2021 - Day 1 - Part 2

$readings = @{}
$NumberOfIncreases = 0
$readings = Get-Content .\input.txt

for ( $i = 3 ; $i -le $readings.Count ; $i++ ) {
    $window1 = [int]$readings[$i] + [int]$readings[$i - 1] + [int]$readings[$i - 2]
    $window2 = [int]$readings[$i - 1] + [int]$readings[$i - 2] + [int]$readings[$i - 3]
    
    if ( $window1 -gt $window2 ) { $NumberOfIncreases++ }
}
$NumberOfIncreases