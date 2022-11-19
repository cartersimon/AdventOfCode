## Script to download input files

## *** This will not work as it is, needs some way to pass logon creds or use browser cookie ***
## Abandoning for now






## Check script is running in correct folder
# get current folder, not the whole path
$curFolder = Split-Path -Path (Get-Location) -Leaf

# assuming we're in the correct folder, remove "AOC" from the string leave just the year
$year = $curFolder -replace '[AOC]',''

# if year doesn't have 4 characters exit the script
if ($year -notmatch '20\d\d' ) {
    $errormsg = "`nYou don't seem to be in the year folder, please double check where the script is running."
    if ($Host.Name -eq 'Windows PowerShell ISE Host') {
        throw $errormsg
    } else {
        exit 1
    }
}

    
# Example source URI... https://adventofcode.com/2021/day/5/input

# Get day number from user
$day = [int](Read-Host -Prompt "Enter day number")

# download the input file and put into correct folders (if it's day 4, needs to go into "day4a" & day4b)

# Source file location
#$source = "https://adventofcode.com/2021/day/$($day)/input"
$source = "https://adventofcode.com/$($year)/day/$($day)/input"

# Destination to save the file
$destinationA = ".\day$($day)a\input.txt"
$destinationB = ".\day$($day)b\input.txt"

#Download the file
Invoke-WebRequest -Uri $source -OutFile $destinationA
Invoke-WebRequest -Uri $source -OutFile $destinationB

