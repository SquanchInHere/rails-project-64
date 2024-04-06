#!/bin/bash sh

if [ -e /var/www/html ]; then
  SEEDED_FILE=/var/www/html/.already_seeded
  pushd /var/www/html
  if [ -e $SEEDED_FILE ]; then
    rake db:migrate || { echo "Can't migrate database"; exit 1; }
  else
    bin/rails db:create
    bin/rails db:migrate || { echo "Can't migrate database"; exit 1; }
    bin/rails db:seed || { echo "Can't seed database"; exit 1; }
    echo 1 > $SEEDED_FILE
  fi

  rake tmp:clear || { echo "Can't clear cache"; }
  popd
fi

bin/rails server -p 80 -b 0.0.0.0