$path = Split-Path -Parent $MyInvocation.MyCommand.Definition
$path=$path+"\"

  
Get-ChildItem -Filter *.bak -Path $path |Remove-Item 
Get-ChildItem -Filter *.bbl -Path $path|Remove-Item
Get-ChildItem -Filter *.aux -Path $path|Remove-Item
Get-ChildItem -Filter *.synctex.gz -Path $path|Remove-Item
Get-ChildItem -Filter *.out -Path $path|Remove-Item
Get-ChildItem -Filter *.sav -Path $path|Remove-Item
Get-ChildItem -Filter *.toc -Path $path|Remove-Item
Get-ChildItem -Filter *.blg -Path $path|Remove-Item
Get-ChildItem -Filter *.log -Path $path|Remove-Item

 $childern=Get-ChildItem -Path $path
 foreach ($child in $childern)
 {
    if ($child.Mode -eq "d----")
    {
Get-ChildItem -Filter *.bak -Path $child.FullName|Remove-Item 
Get-ChildItem -Filter *.bbl -Path $child.FullName|Remove-Item
Get-ChildItem -Filter *.aux -Path $child.FullName|Remove-Item
Get-ChildItem -Filter *.synctex.gz -Path $child.FullName|Remove-Item
Get-ChildItem -Filter *.out -Path $child.FullName|Remove-Item
Get-ChildItem -Filter *.sav -Path $child.FullName|Remove-Item
Get-ChildItem -Filter *.toc -Path $child.FullName|Remove-Item
Get-ChildItem -Filter *.blg -Path $child.FullName|Remove-Item
Get-ChildItem -Filter *.log -Path $child.FullName|Remove-Item
    }
 }

