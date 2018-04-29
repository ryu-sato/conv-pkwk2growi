#!/bin/bash -ex

PAGE_FILE_NAME="page.txt"
ATTACHMENTS_DIR_NAME="attachments"
CMD_CREATE_CROWI_PAGE="create-crowi-page.rb"
SCRIPT_PATH="${PWD}"

# variables
# [TODO] enable to set from command line
DUMP_DIR="${PWD}/dump"

# register markdown data to Growi
cd ${DUMP_DIR}
for f in `find . -name ${PAGE_FILE_NAME}`; do
  RELATIVE_FILE_PATH=$(realpath --relative-to=${SCRIPT_PATH} ${f})
  PAGE_NAME=$(echo ${f} | sed -e 's#/page.txt##' | sed -e 's#^\./##')
  cd ${SCRIPT_PATH}
  cat ${RELATIVE_FILE_PATH} | ruby ${PWD}/${CMD_CREATE_CROWI_PAGE} /${PAGE_NAME}
  cd ${DUMP_DIR}
done