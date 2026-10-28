#!/bin/sh
# Downloads the Rosamund Brass images from the current Drupal site into ./images
# Run this BEFORE the DNS moves away from the old Drupal server.
set -e
cd "$(dirname "$0")"
mkdir -p images
BASE="https://rosamundbrass.co.uk/sites/default/files"
while read -r name path; do
  [ -z "$name" ] && continue
  [ -s "images/$name" ] && { echo "have  $name"; continue; }
  if curl -fsSL "$BASE/$path" -o "images/$name"; then echo "ok    $name"; else echo "FAIL  $name  ($path)"; fi
done <<'LIST'
logo.png rosaRoundwith%20Text.png
hero-street.jpg rosa1.jpg
hero-2.jpg rosa3.jpg
hero-3.jpg rosa5.jpg
itv.jpg rosaITV.jpg
about-2.jpg rosaohil.jpg
quartet.jpg 2023-09/316672581_515501457261541_6054540315518361943_n.jpg
seb.jpg seb.jpg
adam.jpg adam.jpg
georgia.jpg georgia.jpg
alex.jpg alex.jpg
event-lucerne.jpg 2025-11/Lucerne%20Festival.jpg
event-delph.png 2025-11/Rosamund%20Millgate%20Delph.png
event-philip-jones.jpeg 2023-12/Rosamund%20Philip%20Jones.jpeg
event-festival.jpeg 2023-12/Rosamund%20Festival.jpeg
event-itv.jpeg 2023-12/Rosamund%20ITV%202.jpeg
event-burton.jpg 2023-09/311974815_484730453671975_7126417505141767935_n.jpg
event-heron.jpg 2023-09/339063764_739819077869293_8793083926759442161_n.jpg
event-buxton.png 2023-09/rosamundBuxton.png
LIST
chmod 644 images/* 2>/dev/null || true
echo "Done. $(ls images | wc -l) files in ./images"
