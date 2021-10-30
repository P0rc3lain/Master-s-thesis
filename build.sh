#!/usr/bin/env bash

AUX_EXTENSIONS="aux toc out log"
DIST_DIR=distribution
AUX_DIR=auxilary

fail() {
  echo $1
  exit 1
}

mkdir -p ${DIST_DIR} ${AUX_DIR} || fail "Could not create output directories"
pdflatex -halt-on-error -output-directory=distribution master-s-thesis.tex 2>&1 1>/dev/null || fail "Could not build the pdf"
for EXTENSION in $AUX_EXTENSIONS
do 
  FILES=$(find $DIST_DIR -type f -regex ".*.$EXTENSION")
  if [[ ! -z "$FILES" ]]
  then
    mv $FILES $AUX_DIR || fail "Could not move the files"
  fi
done
