$aInput = Get-Content "testinput.txt"

## PART 1
$iTotalScore = 0

foreach($line in $aInput) {
    $sComp1 = $line.Substring(0,$line.Length/2)
    $sComp2 = $line.Substring(($line.Length/2),$line.Length/2)

    $sDiff = Compare-Object -ReferenceObject $sComp1.ToCharArray() -DifferenceObject $sComp2.ToCharArray() -IncludeEqual -ExcludeDifferent | Select-Object -First 1 -ExpandProperty InputObject

    $iScore = 0
    if ($sDiff -cmatch "[A-Z]") {
        $iScore = [byte][char]$sDiff - 38
    }
    else {
        $iScore = [byte][char]$sDiff - 96
    }

    $iTotalScore += $iScore
}

Write-Host "Part 1 total score = $($iTotalScore)" -BackgroundColor Red

## PART 2
$iTotalScore = 0

for($i=0; $i -lt $aInput.Length; $i = $i+3) {
    $aDiff = Compare-Object -ReferenceObject $aInput[$i].ToCharArray() -DifferenceObject $aInput[$i+1].ToCharArray() -IncludeEqual -ExcludeDifferent | Select-Object -ExpandProperty InputObject -Unique

    $sCommon = Compare-Object -ReferenceObject $aDiff -DifferenceObject $aInput[$i+2].ToCharArray() -IncludeEqual -ExcludeDifferent | Select-Object -ExpandProperty InputObject

    $iScore = 0
    if ($sCommon -cmatch "[A-Z]") {
        $iScore = [byte][char]$sCommon - 38
    }
    else {
        $iScore = [byte][char]$sCommon - 96
    }

    $iTotalScore += $iScore
}

Write-Host "Part 2 total score = $($iTotalScore)" -BackgroundColor Red