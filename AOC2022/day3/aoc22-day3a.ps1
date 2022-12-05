## Advent of Code 2022 - Day 3 - Part 1

# Get input data
$ContentsAllBags = Get-Content .\input.txt

# Dictionary to store item values
$itemValues = [ordered]@{}
$itemKey = 97
for ( $value = 1 ; $value -le 26 ; $value++){
    $itemValues.Add([char]$itemKey,$value)
    $itemKey++
}

$itemKey = 65
for ($value = 27 ; $value -le 52 ; $value++){
    $itemValues.Add([char]$itemKey,$value)
    $itemKey++
}

$total = 0
# Split bag into 2 compartments
foreach ( $bag in $ContentsAllBags){
    $bagSize = $bag.Length
    $compartmentSize = $bagSize/2
    $compartmentA = $bag[0..($compartmentSize - 1)]
    $compartmentB = $bag[$compartmentSize..($bagSize - 1)]

    foreach ($itemA in $compartmentA){
        if ($compartmentB -ccontains $itemA){
            $total += $itemValues[$itemA]
            break
        }
    }
}

$total