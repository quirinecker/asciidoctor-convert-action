#!/usr/bin/bash

source ./docker-convert-util.sh

outputPath="output"
inputPath="input"

echo building html

cp -r $inputPath/* $outputPath

if [ $CONVERT_SLIDES = true ]; then
    convertFolderToSlides "$inputPath/slides" "$outputPath/slides"
fi

outputPath="output"
inputPath="input"

convertFolderToHTML "$outputPath"

