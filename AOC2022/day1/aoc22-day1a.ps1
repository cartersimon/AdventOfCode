## Advent of Code 2022 - Day 1 - Part 1

# Get-Content reads the file line-by-line, so there will never be 2 newline chars
# new to either pass the -Raw option... 
#$rawInput = (Get-Content .\testinput.txt -Raw)
# Or pipe to Out-String to concat everything back together...
#$rawInput = Get-Content .\testinput.txt | Out-String

#$nl = [System.Environment]::NewLine
# An array of strings, split by elf
$allElfItemCals = (Get-Content .\testinput.txt -Raw) -split "$nl$nl"
#$allElfItemCals = (Get-Content .\testinput.txt -Raw) -split "`n`n"

$most = 0
$tempTotal = 0
foreach ($elf in $allElfItemCals){
    $item = $elf.split("`n")
    foreach ($i in $item) {
        $tempTotal += [int]$i
    }
    
    if( $most -lt $tempTotal ){ $most = $tempTotal }
    $tempTotal = 0
}

$most