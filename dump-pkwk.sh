#!/bin/bash -ex

PAGE_FILE_NAME="page.txt"
DUMP_DIR="/usr/local/src/conv-pkwk2growi/dump"

# parent of /wiki directory
PUKIWIKI_DATADIR="/var/www/html/"
PUKIWIKI_PAGE_DIR="${PUKIWIKI_DATADIR}/wiki"
PUKIWIKI_ATTACHMENTS_DIR="${PUKIWIKI_DATADIR}/attach"

cd ${PUKIWIKI_PAGE_DIR}
for f in *.txt; do

  PAGE_NAME=$(echo ${f} | sed -e 's/\.txt$//' | sed -e 's/\(..\)/%\1/g' | nkf --url-input)

  # ignore settings files
  if [[ "${PAGE_NAME}" =~ ^:config/ ]]; then
    continue;
  fi

  # create page directory
  PAGE_DIR_NAME=$(echo ${PAGE_NAME} | sed -e 's#[^/]/$##g')
  mkdir -p ${DUMP_DIR}/${PAGE_DIR_NAME}

  # create content file of page file
  cp -ip ${PUKIWIKI_PAGE_DIR}/${f} ${DUMP_DIR}/${PAGE_DIR_NAME}/${PAGE_FILE_NAME}
done

  # [TODO] enable to copy images
  # ATTACHMENTS_DIR_NAME="$()"
