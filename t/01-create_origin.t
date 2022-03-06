#!/bin/sh

num=0

names="mymanifest project_a project_b project_c"

for name in $names; do
  url=$HOME/git/${name}.git

  rm -rf $url
  if [ $? -eq 0 ]; then
    echo "ok : remove $url"
  else
    echo "not ok : remove $url"
  fi
  num=`expr "$num" + 1`

  git init --bare --shared $url
  if [ $? -eq 0 ]; then
    echo "ok : git init $url"
  else
    echo "not ok : git init $url"
  fi
  num=`expr "$num" + 1`

  git clone $url
  if [ $? -eq 0 ]; then
    echo "ok : git clone $url"
  else
    echo "not ok : git clone $url"
  fi
  num=`expr "$num" + 1`

  git -C $name commit --allow-empty -m "first commit"
  if [ $? -eq 0 ]; then
    echo "ok : git commit $name"
  else
    echo "not ok : git commit $name"
  fi
  num=`expr "$num" + 1`

  git -C $name push
  if [ $? -eq 0 ]; then
    echo "ok : git push $name"
  else
    echo "not ok : git push $name"
  fi
  num=`expr "$num" + 1`

  rm -rf $name
  if [ $? -eq 0 ]; then
    echo "ok : rm -rf $name"
  else
    echo "not ok : rm -rf $name"
  fi
  num=`expr "$num" + 1`
done

echo "1..$num"

