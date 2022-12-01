## Advent of Code 2021 - Day 2 - Part 1

$depth = 0
$horPos = 0

$actions = Get-Content .\input.txt

foreach ($line in $actions) {
    $action,$amount = $line.Split()
    if ( $action -eq "forward" ) { $horPos += [int]$amount }
    elseif ( $action -eq "down" ) { $depth += [int]$amount }
    else { $depth -= [int]$amount }
}
return $depth * $horPos