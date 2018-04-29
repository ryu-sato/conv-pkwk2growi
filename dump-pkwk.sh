#!/bin/bash -ex

PAGE_FILE_NAME="page.txt"
DUMP_DIR="/usr/local/src/conv-pkwk2growi/dump"

# parent of /wiki directory
PUKIWIKI_DATADIR="/var/www/html/wiki"

cd ${PUKIWIKI_DATADIR}
for f in *.txt; do

  NEW_NAME=$(echo ${f} | sed -e 's/\.txt$//' | sed -e 's/\(..\)/%\1/g' | nkf --url-input)

  # ignore settings files
  if [[ "${NEW_NAME}" =~ ^:config/ ]]; then
    continue;
  fi

  # create page directory
  cd ${DUMP_DIR}
  echo ${f} | sed -e 's/\.txt$//' | sed -e 's/\(..\)/%\1/g' | nkf --url-input | sed -e 's#[^/]/$##g' | xargs -p mkdir -p

  # create content file of page file
  cp -ip ${PUKIWIKI_DATADIR}/${f} ${DUMP_DIR}/${NEW_NAME}/${PAGE_FILE_NAME}

  cd ${PUKIWIKI_DATADIR}
done
