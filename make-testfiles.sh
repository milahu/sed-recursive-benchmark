#! /usr/bin/env bash

echo "generating test files"

A=10; B=10; C=5 # -> 500 files
#A=10; B=10; C=10 # -> 1000 files
#A=10; B=10; C=20 # -> 2000 files
#A=20; B=20; C=20 # -> 8000 files

# almost no effect (?)
L=100 # lines per file

rootdir=testfiles

testfile=$(mktemp testfile.XXXXXXXXXXX)
for ((l=0; l<$L; l++)); do
echo a >>$testfile
done

for ((a=0; a<$A; a++)); do
for ((b=0; b<$B; b++)); do
for ((c=0; c<$C; c++)); do

mkdir -p $rootdir/$a/$b
cp $testfile $rootdir/$a/$b/$c

done
done
done

rm $testfile

exit 0

# https://stackoverflow.com/a/61481175/10440128

# Creates the folder structure defined in folder structure section below
function createFolderStructure() {
     depth="1"
     while (( "$#" )); do
         while (( $1 != $depth )); do
             cd ..
             (( depth-- ))
         done
         shift
         mkdir "$1"
         cd "$1"
         (( depth++ ))
         shift
       done
     while (( 1 != $depth )); do
         cd ..
         (( depth-- ))
     done
}

# Folder Structure Section
read -r -d '' FOLDERSTRUCTURE << EOM
1 shared
     2 projects 
          3 movies
                4 action
     2 series
     2 backup
EOM


createFolderStructure $FOLDERSTRUCTURE
