#!/usr/bin/env bash

inputDir=$1
outputDir=$2

if [ -z ${inputDir} ];
then
  inputDir='input'
fi

if [ -z ${outputDir} ];
then
  outputDir='output'
fi

./convert.sh $1 $2 $3

remote=$(git remote get-url origin)
cd "$outputDir" || exit

rm -rf .git

git init

git add .

git commit -m "updating github pages"

git branch gh-pages

git remote add origin "$remote"

git push -f origin gh-pages
