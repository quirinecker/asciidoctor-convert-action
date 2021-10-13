#!/usr/bin/bash

source ./docker-scripts/docker-convert-util.sh
inputPath="$INPUT_INPUTPATH"
outputPath="$INPUT_OUTPUTPATH"
slideInputPath="$INPUT_SLIDEINPUTPATH"
slideOutputPath="$INPUT_SLIDEOUTPUTPATH"

echo "input => $inputPath"
echo "output => $outputPath"
echo "slideInputPath => $slideInputPath"
echo "slideOutputPath => $slideOutputPath"
echo building html

mkdir $outputPath
cp -r $inputPath/* $outputPath

if [ $INPUT_SLIDES = true ]; then
    convertFolderToSlides "$slideInputPath" "$slideOutputPath"
fi

inputPath="$INPUT_INPUTPATH"
outputPath="$INPUT_OUTPUTPATH"

convertFolderToHTML "$outputPath"

