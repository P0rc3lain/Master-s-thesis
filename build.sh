#!/usr/bin/env bash

DIST_DIR=distribution
AUX_DIR=auxilary

mkdir -p ${DIST_DIR} ${AUX_DIR}
pdflatex -halt-on-error -output-directory=distribution master-s-thesis.tex 2>&1 1>/dev/null
AUX_EXTENSIONS="aux toc out log"
for EXTENSION in $AUX_EXTENSIONS
do 
  FILES=$(find $DIST_DIR -type f -regex ".*.$EXTENSION")
  if [[ ! -z "$FILES" ]]
  then
    mv $FILES $AUX_DIR
  fi
done
