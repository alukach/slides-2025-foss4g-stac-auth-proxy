#!/usr/bin/env zsh
set -euo pipefail

# Usage: ./download-sat-images.zsh [output-directory]
outdir="${1:-images}"
mkdir -p "$outdir"

download() {
  local id="$1"
  local url="$2"

  echo "Downloading $id ..."
  curl -L "$url" -o "$outdir/${id}.jpg"
}

download "landsat8-ayon-island"                  "https://images.unsplash.com/photo-1722083855371-0d5a25647ce6"
download "landsat9-kangerdlugssuaq-greenland"    "https://images.unsplash.com/photo-1722080768196-8983bbbb5c0f"
download "landsat8-klyuchevskaya-kamchatka"      "https://images.unsplash.com/photo-1744968776900-311abae36ead"
download "blue-white-red-abstract-painting"      "https://images.unsplash.com/photo-1579818276659-2943e3cd4b30"
download "satellite-image-body-of-water"         "https://images.unsplash.com/photo-1722082839868-d900d1a07e69"
download "landsat9-taklimakan-desert-china"      "https://images.unsplash.com/photo-1722080767795-af488166033d"
download "sentinel2a-southern-tibetan-plateau"   "https://images.unsplash.com/photo-1744968777300-210d3bb46817"
download "landsat9-bangladesh-coast"             "https://images.unsplash.com/photo-1722083854850-4a24185465ac"
download "landsat8-ord-river-australia"          "https://images.unsplash.com/photo-1744968776986-3deb08e40a24"
download "landsat9-western-guinea-bissau"        "https://images.unsplash.com/photo-1722083854982-2f1516cf263c"
download "landsat9-apostle-islands-lake-superior" "https://images.unsplash.com/photo-1722080767251-aad7fa1796d3"

echo "Done. Images saved in: $outdir"