#!/usr/bin/bash

ls
source ./docker-convert-util.sh
inputPath="$INPUT_INPUTPATH"
outputPath="$INPUT_OUTPUTPATH"

echo "input => $inputPath"
echo "output => $outputPath"

cd ..

echo building html

cp -r $inputPath/* $outputPath

if [ $INPUT_SLIDES = true ]; then
    convertFolderToSlides "$inputPath/slides" "$outputPath/slides"
fi

inputPath="$INPUT_INPUTPATH"
outputPath="$INPUT_OUTPUTPATH"

convertFolderToHTML "$outputPath"

