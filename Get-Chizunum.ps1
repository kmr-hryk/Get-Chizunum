[reflection.assembly]::LoadWithPartialName("Microsoft.VisualBasic") > $null
$vbnarrow = [Microsoft.VisualBasic.VbStrConv]::Narrow
$Filename = $ARGS[0]

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
   $Chizunum = $tmp[2],[Microsoft.VisualBasic.Strings]::StrConv($tmp[4],$vbnarrow)
   for ( $i=21 ; $i -le $tmp.Length ; $i++) {
      $tmpnum = [Microsoft.VisualBasic.Strings]::StrConv($tmp[$i],$vbnarrow)
      if ( $tmpnum.Length -ne 0 ) {
         $idxnum = $tmpnum.IndexOf("0")
         $mae = $tmpnum.SubString(0,$idxnum)
         $soe = $tmpnum.SubString($idxnum + 1,1)
         $ban = $tmpnum.SubString($idxnum + 2)
         $Chizunum += $mae + $soe + " " + $ban
      }
   }
   $Chizunum = $Chizunum -join ","
   Write-Output $Chizunum
}

#| Out-File $Filename.Replace(".atr",".csv")