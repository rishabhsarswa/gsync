#!/bin/bash

set -eu 
groot="$(dirname $0)/.."
cd "$groot"

source gbin/lib.sh

rm -rvf "$gtmp"
mkdir -p "$gtmp/a"
tar -cvf "$gtmp/a/fs.tar.xz" fs
acrypter encrypt cry15360 "$gtmp/a/fs.tar.xz" "$gtmp/a/fs.tar.xz.acrypt"
rm "$gtmp/a/fs.tar.xz"

cd "$egit"

rm -rvf acrypt
mkdir acrypt

chmod +x ../$gfs/sync.sh
../$gfs/sync.sh

cp "../$gbin/recover.sh" .

mv "../$gtmp/a/fs.tar.xz.acrypt" "acrypt/fs.tar.xz.acrypt"


#rsync -av --progress /home/rishu/data/smj_data smj_data

echo "Loading data into Git ... "

exit
#git remote set-url origin https://rishabhsarswa:TOKEN@github.com/rishabhsarswa/docs.git


git add .
git commit -m "mark update auto $@"
git push origin main
