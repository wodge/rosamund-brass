# Rosamund Brass Quartet — website

Static replacement for the old Drupal site at rosamundbrass.co.uk.

## First-time setup (do this BEFORE moving DNS)

```sh
./get-images.sh      # pulls every photo from the live Drupal site into ./images
```

Then commit them (`git add images && git commit -m "Add images" && git push`) — once DNS moves, the old site and its images are gone, so the repo becomes their home.

Until `./images` is populated, the page falls back to loading images from the old site.

## Editing

Players, performances, gallery, phone, email and social links live in the `SITE` object near the bottom of `index.html`.
Set `email:` to switch the enquiry form from WhatsApp to email.

## Deploying (nowoshared)

```sh
docker compose up -d
# after updates:
git pull && docker compose restart
```

© Rosamund Brass Quartet. Site by No Worries IT Ltd.
