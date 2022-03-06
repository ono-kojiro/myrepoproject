#!/bin/sh

echo "1..1"

cd work
repo sync
if [ $? -eq 0 ]; then
  echo "ok : repo sync"
else
  echo "not ok : repo sync"
fi

