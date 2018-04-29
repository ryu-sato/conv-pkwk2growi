#!/bin/bash -ex

PAGE_FILE_NAME="page.txt"
ATTACHMENTS_DIR_NAME="attachments"

# variables
# [TODO] enable to set from command line
DUMP_DIR="/usr/local/src/conv-pkwk2growi/dump"
PUKIWIKI_DATADIR="/var/www/html"
PUKIWIKI_PAGE_DIR="${PUKIWIKI_DATADIR}/wiki"
PUKIWIKI_ATTACHMENTS_DIR="${PUKIWIKI_DATADIR}/attach"

# dump pukiwiki pages
cd ${PUKIWIKI_PAGE_DIR}
for f in *.txt; do

  PAGE_NAME=$(echo ${f} | sed -e 's/\.txt$//' | sed -e 's/\(..\)/%\1/g' | nkf --url-input)

  # ignore settings files
  if [[ "${PAGE_NAME}" =~ ^:config/ ]]; then
    continue;
  fi

  # copy page directory
  PAGE_DIR_NAME=$(echo ${PAGE_NAME} | sed -e 's#[^/]/$##g')
  mkdir -p ${DUMP_DIR}/${PAGE_DIR_NAME}
  cp -ip ${PUKIWIKI_PAGE_DIR}/${f} ${DUMP_DIR}/${PAGE_DIR_NAME}/${PAGE_FILE_NAME}
done

# dump attachments
cd ${PUKIWIKI_ATTACHMENTS_DIR}
for f in *; do

  if [[ ! "${f}" =~ ^[0-9A-F_]+$ ]]; then
    continue;
  fi

  # copy attachments
  PAGE_DIR_NAME=$(echo ${f} | sed -e 's/_.*$//' | sed -e 's/\(..\)/%\1/g' | nkf --url-input)
  ATTACHMENTS_FILE_NAME=$(echo ${f} | sed -e 's/^[^_]*_//g' | sed -e 's/\(..\)/%\1/g' | nkf --url-input)
  mkdir -p ${DUMP_DIR}/${PAGE_DIR_NAME}/${ATTACHMENTS_DIR_NAME}
  cp -ip ${PUKIWIKI_ATTACHMENTS_DIR}/${f} ${DUMP_DIR}/${PAGE_DIR_NAME}/${ATTACHMENTS_DIR_NAME}/${ATTACHMENTS_FILE_NAME}
done
