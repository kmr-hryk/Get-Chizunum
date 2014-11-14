$Filename = $ARGS[0]
$Filename = $(Get-ChildItem $Filename).FullName

$Chisekiatr = [System.IO.File]::ReadAllText($Filename)

Write-Output $Chisekiatr