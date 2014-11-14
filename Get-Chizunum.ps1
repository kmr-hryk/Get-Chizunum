$Filename = $ARGS[0]
$Chisekiatr = ""
$Chizunum =""

$Filename = $(Get-ChildItem $Filename).FullName

$Chisekiatr = Get-Content $Filename | ForEach-Object {
   if ($_ -match "^[0-9]") {
      Write-Output "`r`n$_"
   } else {
      Write-Output ",$_"
   }
}

$Chisekiatr = $Chisekiatr -join "" -Split "`r`n"

Write-Output $Chisekiatr | ForEach-Object {
   $tmp = $_.Split(",")
   $Chizunum = $tmp[2],$tmp[4]
   for ( $i=21 ; $i -le $tmp.Length ; $i++) {
      $Chizunum += $tmp[$i]
   }
   $Chizunum = $Chizunum -join ","
   Write-Output $Chizunum
}
