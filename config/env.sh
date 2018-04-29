#!/bin/bash -e

SCRIPT_PATH="${PWD}"

PAGE_FILE_NAME="page.txt"
ATTACHMENTS_DIR_NAME="attachments"

# variables
# [TODO] enable to set from command line
DUMP_DIR="${PWD}/dump"
PUKIWIKI_DATADIR="${PWD}/pukiwiki"
PUKIWIKI_PAGE_DIR="${PUKIWIKI_DATADIR}/wiki"
PUKIWIKI_ATTACHMENTS_DIR="${PUKIWIKI_DATADIR}/attach"

CMD_CREATE_CROWI_PAGE="create-crowi-page.rb"
