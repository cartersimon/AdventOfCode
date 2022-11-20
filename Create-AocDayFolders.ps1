## Script for setting up event

# Needs to be run in year folder "AOC2021", "AOC2022", or similar

# Edit this to provide year for use in PS1 filename & comment
$year = "22"

for ( $i = 1 ; $i -le 25 ; $i++ ) { 
    # Create day folders
    mkdir .\"day$($i)a"
    mkdir .\"day$($i)b"
    
    # create empty files ready to put input data
    New-Item .\day$($i)a\input.txt
    New-Item .\day$($i)a\testinput.txt
    New-Item .\day$($i)b\input.txt
    New-Item .\day$($i)b\testinput.txt
    
    # create PS1 files ready to code, with identifying comment at top of file
    New-Item .\day$($i)a\aoc$($year)-day$($i)a.ps1
    Set-Content .\day$($i)a\aoc$($year)-day$($i)a.ps1 "## Advent of Code 20$($year) - Day $($i) - Part 1"

    New-Item .\day$($i)b\aoc$($year)-day$($i)b.ps1
    Set-Content .\day$($i)b\aoc$($year)-day$($i)b.ps1 "## Advent of Code 20$($year) - Day $($i) - Part 2"

}