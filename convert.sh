#!/usr/bin/env bash

source .env

inputDir=$INPUTPATH
outputDir=$OUTPUTPATH
convertSlides=$SLIDES

echo "revealjs" > "$inputDir/slides/.gitignore"

echo "inputDir => $inputDir"
echo "outputDir => $outputDir"
echo "convertSlides => $convertSlides"

# docker build . -t docker.pkg.github.com/quirinecker/asciidoctor-convert-action/docker-image:latest --progress=plain --no-cache
docker run \
    -v $PWD/:/app \
    -e INPUT_SLIDES=$convertSlides \
    -e INPUT_INPUTPATH=$inputDir \
    -e INPUT_OUTPUTPATH=$outputDir \
     docker.pkg.github.com/quirinecker/asciidoctor-convert-action/docker-image:latest
