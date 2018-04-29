#!/bin/bash -ex

# read variables
. config/env.sh

# convert pukiwiki pages to markdown
cd ${DUMP_DIR}
for f in `find . -name ${PAGE_FILE_NAME}`; do

  # convert content from pukiwiki to markdown
  TEMPFILE=$(mktemp -t conv-pkwk2growi.XXXXX) || exit 1
  # see. https://qiita.com/yuki-takei/items/152e20f4421333ae8fd9
  cat ${f} | sed -e 's/ \[#[0-9a-z]\+\]$//g' -e 's/^\*\*\*/###/g' -e 's/^\*\*/##/g' -e 's/^\*/#/g' -e 's/^---/        -/g' -e 's/^--/    -/g' -e 's/^\(\s*\)-\([^ ]\)/\1- \2/g' -e 's/&br;/<br>/g' -e 's/^#pre{*/```/g' -e 's/^}}*/```/g' -e 's/%%/~~/g' -e "s/^\#lsx/`echo -ne '\u0024'`lsx()/g" > ${TEMPFILE}
  mv $TEMPFILE ${f}
done
