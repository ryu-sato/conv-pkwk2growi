#!/bin/bash -e

# User configs
## Output directory to execute script
DUMP_DIR="${PWD}/dump"
## Target directory to convert (Files are NOT overrided by script.)
PUKIWIKI_DATADIR="${PWD}/pukiwiki"

# System config
SCRIPT_PATH="${PWD}"
CMD_CREATE_CROWI_PAGE="create-crowi-page.rb"
CMD_ATTACH_FILE_TO_CROWI_PAGE="attach-files-to-crowi-page.rb"
PAGE_FILE_NAME="page.txt"
ATTACHMENTS_DIR_NAME="attachments"

## Target directory 
PUKIWIKI_PAGE_DIR="${PUKIWIKI_DATADIR}/wiki"
PUKIWIKI_ATTACHMENTS_DIR="${PUKIWIKI_DATADIR}/attach"
