## Advent of Code 2021 - Day 1 - Part 1

$readings = @{}
$NumberOfIncreases = 0
$readings = Get-Content .\input.txt

for ( $i = 1 ; $i -le $readings.Count ; $i++ ) {
    if ( [int]$readings[$i] -gt [int]$readings[$i - 1] ) { $NumberOfIncreases++ }
}
$NumberOfIncreases