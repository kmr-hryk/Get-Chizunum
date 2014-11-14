$Filename = $ARGS[0]
$Filename = $(Get-ChildItem $Filename).FullName

$Chisekiatr = Get-Content $Filename | ForEach-Object { if ($_ -match "^[0-9]") { Write-Output "`r`n$_" } else { Write-Output ",$_" } }

$Chisekiatr = $Chisekiatr -join ""

Write-Output $Chisekiatr