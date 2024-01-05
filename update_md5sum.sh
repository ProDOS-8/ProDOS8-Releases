#!/bin/bash

function sum() {
  find -maxdepth 1 -mindepth 1 -iname \*.${1} -exec ${2} {} \; | grep -v _site
}

sum "po"  "md5sum" | tee MD5SUM
sum "dsk" "md5sum" | tee -a MD5SUM

sum "po"  "sha256sum" | tee SHA256SUM
sum "dsk" "sha256sum" | tee -a SHA256SUM

