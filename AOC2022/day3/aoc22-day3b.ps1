## Advent of Code 2022 - Day 3 - Part 2

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

# Compare groups of 3
for ( $i = 0 ; $i -le ($ContentsAllBags.Length - 3) ; $i += 3 ){
    $firstBag = $ContentsAllBags[$i].ToCharArray()
    $secondBag = $ContentsAllBags[$i+1].ToCharArray()
    $thirdBag = $ContentsAllBags[$i+2].ToCharArray()
    # Check each item of 1st bag against 2nd bag

    $common = $firstBag | Where-Object { $_ -cin $secondBag -and $_ -cin $thirdBag } | Select-Object -First 1
    $total += $itemValues[$common]
}
$total