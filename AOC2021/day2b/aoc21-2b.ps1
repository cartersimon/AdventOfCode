## Advent of Code 2021 - Day 2 - Part 2

$aim = 0
$depth = 0
$horPos = 0

$actions = Get-Content .\input.txt

foreach ($line in $actions) {
    $action,$amount = $line.Split()
    if ( $action -eq "forward" ) { 
        $horPos += [int]$amount 
        $depth += $aim * [int]$amount
    }
    elseif ( $action -eq "down" ) { $aim += [int]$amount }
    else { $aim -= [int]$amount }
}
return $depth * $horPos