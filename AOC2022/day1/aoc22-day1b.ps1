## Advent of Code 2022 - Day 1 - Part 2

#$nl = [System.Environment]::NewLine
## An array of strings, split by elf
#$allElfItemCals = (Get-Content .\testinput.txt -Raw) -split "$nl$nl"
$allElfItemCals = (Get-Content .\input.txt -Raw) -split "`n`n"

## For each elf, total the calories they're carrying & store in an array
$arr = @()

foreach ($elf in $allElfItemCals){
    $tempTotal = 0
    $item = $elf.split("`n")
    foreach ($i in $item) {
        $tempTotal += [int]$i
    }
    $arr += $tempTotal
}

## sort array, sum 3 biggest & display
$v1, $v2, $v3 = $arr | Sort-Object -Descending | Select-Object -First 3
$v1 + $v2 + $v3

