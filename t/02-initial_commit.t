#!/bin/sh

set -e

echo "1..1"

rm -rf work
mkdir -p work
cd work

url=$HOME/git/mymanifest.git
git clone $url
cd mymanifest

cat - << EOS > default.xml
<?xml version="1.0" encoding="utf-8"?>
<manifest>
  <remote name="localrepo" fetch="file://${HOME}/git"/>
  <default revision="master" remote="localrepo"/>
  <project path="work_a" name="project_a.git"/>
  <project path="work_b" name="project_b.git"/>
  <project path="work_c" name="project_c.git"/>
</manifest>
EOS

git add default.xml
git commit -m 'first commit'
git push

if [ $? -eq 0 ]; then
  echo "ok : initial commit"
else
  echo "not ok : initial commit"
fi

