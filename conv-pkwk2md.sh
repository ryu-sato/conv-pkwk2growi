#!/bin/bash -ex

# read variables
. config/env.sh

# see. https://ja.stackoverflow.com/questions/39713/%E4%BB%BB%E6%84%8F%E3%81%AE%E3%83%95%E3%82%A9%E3%83%AB%E3%83%80%E3%81%AE%E4%B8%AD%E3%82%92%E6%A4%9C%E7%B4%A2%E3%81%97-%E6%9D%A1%E4%BB%B6%E3%81%AB%E4%B8%80%E8%87%B4%E3%81%97%E3%81%9F%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%8C%E3%81%82%E3%82%8C%E3%81%B0%E5%87%A6%E7%90%86%E3%82%92%E3%81%99%E3%82%8B%E3%82%B7%E3%82%A7%E3%83%AB%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%97%E3%83%88%E3%82%92%E6%9B%B8%E3%81%8D%E3%81%9F%E3%81%84
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# convert pukiwiki pages to markdown
cd ${DUMP_DIR}
for f in `find . -name ${PAGE_FILE_NAME}`; do

  # convert content from pukiwiki to markdown
  TEMPFILE=$(mktemp -t conv-pkwk2growi.XXXXX) || exit 1
  # see. https://qiita.com/yuki-takei/items/152e20f4421333ae8fd9
  cat "${f}" | sed -e 's/ \[#[0-9a-z]\+\]$//g' \
    -e 's/^\*\*\*/###/g' -e 's/^\*\*/##/g' -e 's/^\*/#/g' \
    -e 's/^---/        -/g' -e 's/^--/    -/g' -e 's/^\(\s*\)-\([^ ]\)/\1- \2/g' \
    -e 's/^[\+][\+][\+]/        1./g' -e 's/^[\+][\+]/    1./g' -e 's/^[\+]/1./g' -e 's/^\(\s*\)1\.\([^ ]\)/\11. \2/g' \
    -e 's/&br;/<br>/g' \
    -e 's/^#pre{*/```/g' -e 's/^}}*/```/g' \
    -e 's/%%/~~/g' \
    -e "s/^\#lsx/`echo -ne '\u0024'`lsx()/g" -e 's/^\(#\+\)\([^ #]\)/\1 \2/g' \
    > "${TEMPFILE}"
  mv "$TEMPFILE" "${f}"
done
