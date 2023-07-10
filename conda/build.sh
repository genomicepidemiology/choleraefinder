#!/bin/bash

mkdir -p ${PREFIX}/bin

chmod +x choleraefinder.py
cp choleraefinder.py ${PREFIX}/bin/choleraefinder.py

# copy script to download database
chmod +x ${RECIPE_DIR}/download-cholerae-db.sh
cp ${RECIPE_DIR}/download-cholerae-db.sh ${PREFIX}/bin/download-cholerae-db.sh
