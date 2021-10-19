#!/usr/bin/env bash
inputDir=$1
outputDir=$2
convertSlides=$3

if [ -z ${inputDir} ];
then
  inputDir='input'
fi

if [ -z ${outputDir} ];
then
  outputDir='output'
fi

if [ -z ${convertSlides} ];
then
  convertSlides=true
fi

echo "inputDir => $inputDir"
echo "outputDir => $outputDir"
echo "convertSlides => $convertSlides"
docker build . -t ascii-convert
docker run \
    -v $PWD/:/app/ \
    -e INPUT_SLIDES=$convertSlides \
    -e INPUT_INPUTPATH=$inputDir \
    -e INPUT_OUTPUTPATH=$outputDir \
     ascii-convert
