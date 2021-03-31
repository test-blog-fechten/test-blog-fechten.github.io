$fileadd="new-post"
$sdate=Get-Date -UFormat '+%Y-%m-%d' 
$path="../../fechten-hamm.github.io/_posts/"
$filename=$path+$sdate+"-"+$fileadd+".md"

New-Item -Path . -Name $filename -ItemType "file" 

$From = Get-Content -Path $args[0] # 2021-03-28-karten-mischen.md
echo $From

Add-Content -Path $filename -Value $From

#end