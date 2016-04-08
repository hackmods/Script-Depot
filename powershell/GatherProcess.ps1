#bonus
  gps | where{ $_.name -like "*Win*"} | sort ws -Des | ft @{N='Process'; E='ProcessName'},Id,@{N='Working_Set'; E='ws'},handles
#bonus Long
  Get-Process | Where-Object{ $_.Name -like "*Win*"} | Sort-Object WS -Descending | Format-Table @{N='Process'; E='ProcessName'},Id,@{N='Working_Set'; E='ws'},handles

# Answer
gps | where{ $_.name -like "*Win*"} | sort ws -Des | ft ProcessName,Id,ws,handles

# Long form
Get-Process | Where-Object{ $_.Name -like "*Win*"} | Sort-Object WS -Descending | Format-Table ProcessName,Id,ws,handles

