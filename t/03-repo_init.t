#!/bin/sh

echo "1..1"

rm -rf work
mkdir -p work
cd work

url=$HOME/git/mymanifest.git
repo init -u $url
if [ $? -eq 0 ]; then
  echo "ok : repo init"
else
  echo "not ok : repo init"
fi

