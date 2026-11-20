#!/bin/bash

set -exu 
groot="$(dirname $0)/.."
cd "$groot"

egit="egit"
gfs="fs"
gbin="gbin"

pwd
echo "$gbin"
echo "$gfs"
echo "$egit"

tar -cvf fs.tar.xz fs
acrypter encrypt cry15360 fs.tar.xz fs.tar.xz.acrypt

cd "$egit"
rm -rvf acrypt
mkdir acrypt
mv ../fs.tar.xz.acrypt "acrypt/fs.tar.xz.acrypt"

exit


#rsync -av --progress /home/rishu/data/smj_data smj_data

echo "Loading data into Git ... "


#git remote set-url origin https://rishabhsarswa:TOKEN@github.com/rishabhsarswa/docs.git


git add .
git commit -m "mark update auto $@"
git push origin main
