## Advent of Code 2022 - Day 3 - Part 2

# Get input data
$ContentsAllBags = Get-Content .\testinput.txt

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

#$total = 0

# Compare groups of 3
for ( $i = 0 ; $i -le ($ContentsAllBags.Length - 3) ; $i += 3 ){
    #foreach ($elfAitem in $ContentsAllBags[$i]){
    for ( $j = 0 ; $j -le ($ContentsAllBags[$i]).Length ; $j++ ){
        if ( $ContentsAllBags[$i+1] -ccontains ($ContentsAllBags[$i])[$j] ) {
            Write-Host ($ContentsAllBags[$i])[$j]
            Write-Host "...found in A and B"
        }
            #$elfAitem
            # if ($ContentsAllBags[$i+1] -ccontains $elfAitem){
            #     Write-Host "$elfAitem is in elfA & elfB"
            #     if ($ContentsAllBags[$i+2] -ccontains $elfAitem){
            #         Write-Host "$elfAitem is in all"
            #         $total += $itemValues[$itemsA]
            #         break
            # }

    }
}


# find common item


# # Split bag into 2 compartments
# foreach ( $bag in $ContentsAllBags){
#     $found = $false
#     $compartmentSize = $bag.Length/2
#     $compartmentA = $bag[0..($compartmentSize - 1)]
#     #Write-Host $compartmentA

#     $compartmentB = $bag[$compartmentSize..($bag.Length - 1)]
#     #Write-Host $compartmentB

#     foreach ($itemA in $compartmentA){
#         if ($compartmentB -ccontains $itemA){
#             #write-host "$itemA is in both compartments of this bag"
#             $total += $itemValues[$itemA]
#             $found = $true
#         }
#         if ($found){ break }
#     }
# }

#$total