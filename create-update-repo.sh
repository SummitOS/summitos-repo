#!/bin/bash
x86_64_pkgbuild=$(find ../packages -type f -name "*.pkg.tar.zst*")
echo "Packages to copy:"
echo $x86_64_pkgbuild

for x in ${x86_64_pkgbuild}
do 
    echo "Moving ${x}"
    mv "${x}" x86_64/
done

echo "###########################"
echo "Building the repo database"
echo "###########################"

cd x86_64
rm summitos.files*
rm summitos.db*

echo "Building for x86_64"

repo-add -s -n -R summitos.db.tar.gz *.pkg.tar.zst

echo "#######################################"
echo "Packages in the repo have been updated!"
echo "#######################################"
