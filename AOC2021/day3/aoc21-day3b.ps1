## Advent of Code 2021 - Day 3 - Part 2

# Got super tired and ended up copying from a reddit forum (user rmbolger)
# https://www.reddit.com/r/PowerShell/comments/r7u48w/advent_of_code_2021_day_3_binary_diagnostic/
# *** Go thru this and figure out how this works ***

# split our list of strings into a list of char arrays
$diags = Get-Content .\input.txt | % { ,[char[]]$_ }

function Get-CommonValue {
    [CmdletBinding()]
    param(
        [object[]]$diags,
        [int]$Bit,
        [switch]$LeastCommon
    )

    # count ones in this position
    $oneCount = 0
    $diags | %{
        $oneCount += [string]$_[$Bit]
    }

    # decide which to keep depending on Most or Least common
    $countHalf = $diags.Count / 2
    if ($LeastCommon) {
        $keep = ($countHalf -le $oneCount) ? '0' : '1'
    } else {
        $keep = ($countHalf -le $oneCount) ? '1' : '0'
    }

    # filter the inputs
    $filtered = @($diags | ?{ $_[$Bit] -eq $keep })
    Write-Verbose "Bit $Bit : half $countHalf, oneCount $oneCount, keep $keep, filteredCount $($filtered.Count)"

    # recurse with the filtered results on the next position or return
    if ($filtered.Count -gt 1) {
        Write-Verbose "recurse"
        Get-CommonValue $filtered ($Bit+1) -LeastCommon:$LeastCommon.IsPresent
    } else {
        Write-Verbose "returning $($filtered[0] -join '')"
        $filtered[0] -join ''
    }
}

# get most common val for oxy and least common for co2
$oxyStr = Get-CommonValue $diags 0
$co2Str = Get-CommonValue $diags 0 -LeastCommon
Write-Verbose "oxy $oxyStr, co2 $co2Str"

# binary to int and multiply
[Convert]::ToInt32($oxyStr,2) * [Convert]::ToInt32($co2Str,2)