## Advent of Code 2022 - Day 4 - Part 1

$AllAssignments = (Get-Content .\input.txt).Split()

$count = 0
foreach ($pair in $AllAssignments){
    $elf1, $elf2 = $pair.Split(",")
    [int]$elf1min, [int]$elf1max = $elf1.Split("-")
    [int]$elf2min, [int]$elf2max = $elf2.Split("-")
    
    if ( ($elf1min -ge $elf2min -and $elf1max -le $elf2max) -or ($elf2min -ge $elf1min -and $elf2max -le $elf1max) ){
        $count++
    }
}
$count