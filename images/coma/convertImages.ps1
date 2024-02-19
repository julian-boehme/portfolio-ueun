$OutputDir = "JPGs"
if (-Not (Test-Path $OutputDir)) {
    New-Item $OutputDir -ItemType Directory
}
$Children = Get-ChildItem -Filter "*.png"
foreach ($Image in $Children) {
    $ImageName = Split-Path $Image -LeafBase
    $DestPath = Join-Path $OutputDir "$ImageName.jpg"
    ffmpeg -i $Image -vf scale="-1:1080" -q:v 1 $DestPath -hide_banner -n
}