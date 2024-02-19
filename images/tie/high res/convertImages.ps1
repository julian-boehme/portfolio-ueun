$OutputDir = "JPGs"
if (-Not (Test-Path $OutputDir)) {
    New-Item $OutputDir -ItemType Directory
}
$Children = Get-ChildItem -Filter "*.png"
foreach ($Image in $Children) {
    $ImageName = Split-Path $Image -LeafBase
    $DestPath = Join-Path $OutputDir "$ImageName.jpg"
    ffmpeg -i $Image -vf scale="-1:720" -q:v 5 $DestPath -hide_banner -n
}