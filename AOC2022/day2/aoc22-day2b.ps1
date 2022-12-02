## Advent of Code 2022 - Day 2 - Part 2

# Get input data
$guide = Get-Content .\input.txt

$myTotalScore = 0

# Get value of a play... Rock: 1, Paper: 2, Scissors: 3 
function Get-Value {
    param (
        [Parameter(Mandatory)]  [String]$RPS
    )
    if( $RPS -eq "X" -or $RPS -eq "A" ) { return 1 }
    if ($RPS -eq "Y" -or $RPS -eq "B" ) { return 2 }
    if ($RPS -eq "Z" -or $RPS -eq "C" ) { return 3 }
}

function WinLoseDraw {
    param (
        [String]$me,
        [String]$opp
    )
    switch ($me) {
        "X" { 
            if ($opp -eq  "C") { return 6} 
            elseif ($opp -eq "A") { return 3}
            else { return 0 }
        }
        "Y" {
            if ($opp -eq  "A") { return 6} 
            elseif ($opp -eq "B") { return 3}
            else { return 0 }
        }
        "Z" {
            if ($opp -eq  "B") { return 6} 
            elseif ($opp -eq "C") { return 3}
            else { return 0 }
        }
        Default {}
    }
} 

function GetNextPlay {
    param (
        [String]$opp,
        [String]$desiredResult
    )
    switch ($opp) {
        "A" { 
            if ($desiredResult -eq  "X") { return "C"} # Lose
            elseif ($desiredResult -eq "Y") { return "A"} # Draw
            else { return "B" } # Win
        }
        "B" {
            if ($desiredResult -eq  "X") { return "A"}  # Lose
            elseif ($desiredResult -eq "Y") { return "B"} # Draw
            else { return "C" } # Win
        }
        "C" {
            if ($desiredResult -eq  "X") { return "B"}  # Lose
            elseif ($desiredResult -eq "Y") { return "C"} # Draw
            else { return "A" } # Win
        }
        Default {}
    }
    
}


# Go thru all games
foreach ( $game in $guide ){

    # Separate mine and opponents plays
    $opponentPlays, $iPlay = $game.Split(" ")
    $myNextPlay = GetNextPlay $opponentPlays $iPlay

    $myScore  = Get-Value($myNextPlay)
    $myTotalScore += $myScore

    # Add 6 points for a win, 3 for a draw
    $myTotalScore += WinLoseDraw $myNextPlay $opponentPlays
}

# getting 12248, too high
# 4928, too low
$myTotalScore