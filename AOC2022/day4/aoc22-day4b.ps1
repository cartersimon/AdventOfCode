## Advent of Code 2022 - Day 4 - Part 2

$AllAssignments = (Get-Content .\input.txt).Split()

$count = 0
$notOverlapping = 0

foreach ($pair in $AllAssignments){
    $elf1, $elf2 = $pair.Split(",")
    [int]$elf1min, [int]$elf1max = $elf1.Split("-")
    [int]$elf2min, [int]$elf2max = $elf2.Split("-")
    
    if ( $elf1max -lt $elf2min -or $elf1min -gt $elf2max ){
        $notOverlapping++
    }
    $count++
}
$count - $notOverlapping