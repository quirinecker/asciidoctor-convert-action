#!/usr/bin/env bash

source .env

./convert.sh $1 $2 $3

remote=$(git remote get-url origin)
cd "$OUTPUTPATH" || exit

rm -rf .git

git init

git add .

git commit -m "updating github pages"

git branch gh-pages

git remote add origin "$remote"

git push -f origin gh-pages
