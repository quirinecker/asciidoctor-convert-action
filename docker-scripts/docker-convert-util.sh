#!/usr/bin/bash

convertFolderToSlides() {
  inputPath=$1
  dirOutputPath=$2
  baseOutputPath=$3

  echo "=== compiling Slides  ==="

  i=1
  numberOfFiles=$(find "$outputPath" -type f -name "*.adoc" | wc -l)
  [ ! -d "$inputPath/revealjs" ] && downloadReveal "$inputPath" "$outputPath"

  for f in $(find "$outputPath" -type f -name "*.adoc"); do
      imgFolder=$(evalPath "/documents/${f%/*}" "/documents/output/images")
      revealFolder=$(evalPath "/documents/${f%/*}" "/documents/$dirOutputPath/revealjs")

      echo "[$((i*100 / numberOfFiles)) %] compiling $f"
      convertFileToSlides "$f" "$imgFolder" "$revealFolder"

      i=$((i+1))
  done
}

convertFileToSlides() {
  file=$1
  imgFolder=$2
  revealFolder=$3

  asciidoctor-revealjs \
         -r asciidoctor-diagram \
         -a icons=font \
         -a revealjs_theme=white \
         -a source-highlighter=rouge \
         -a imagesdir="$imgFolder" \
         -a revealjsdir="$revealFolder" \
         -a revealjs_slideNumber=c/t \
         -a revealjs_transition=slide \
         -a revealjs_hash=true \
         -a sourcedir=src/main/java \
         -b revealjs \
         "$file"
  rm "$file"
}

downloadReveal() {
  inputPath=$1
  outputPath=$2
  REVEAL_VERSION="3.9.2"
  REVEAL_DIR="$inputPath"
  curl -L https://github.com/hakimel/reveal.js/archive/$REVEAL_VERSION.zip --output revealjs.zip
  unzip revealjs.zip
  mv reveal.js-$REVEAL_VERSION ./$REVEAL_DIR/revealjs
  cp -r "$inputPath/revealjs" "$outputPath/revealjs"
  rm revealjs.zip
}

evalPath() {
  pos=$1
  ref=$2
  down=''

  while :; do
      test "$pos" = '/' && break
      case "$ref" in $pos/*) break;; esac
      down="../$down"
      pos=${pos%/*}
  done

  echo "$down${ref##$pos/}"
}

convertFolderToHTML() {
    outputPath=$1

    echo "=== compiling HTML  ==="

    i=1
    numberOfFiles=$(find "$outputPath" -type f -name "*.adoc" | wc -l)
    for f in $(find "$outputPath" -type f -name "*.adoc"); do
        imgFolder=$(evalPath "/documents/${f%/*}" "/documents/output/images")

        echo "[$((i*100 / numberOfFiles)) %] compiling $f"
        convertFileToHTML "$f" "$imgFolder"

        i=$((i+1))
    done
}

convertFileToHTML() {
  file=$1
  imgFolder=$2

    asciidoctor \
      -r asciidoctor-diagram \
      -a icons=font \
      -a experimental=true \
      -a source-highlighter=rouge \
      -a rouge-theme=github \
      -a rouge-linenums-mode=inline \
      -a docinfo=shared \
      -a imagesdir="$imgFolder" \
      -a toc=left \
      -a toclevels=2 \
      -a sectanchors=true \
      -a sectnums=true \
      -a favicon=themes/favicon.png \
      -a sourcedir=src/main/java \
      -b html5 \
      "$file"
    rm "$file"
}
