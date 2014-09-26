#!/bin/sh

dos2unix $1
awk -f sql2doc.awk $1 >dbtable.js
