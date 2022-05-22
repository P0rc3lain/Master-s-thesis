#!/usr/bin/env bash

#
#  Copyright © 2022 Mateusz Stompór. All rights reserved.
#

DIST_DIR=distribution
BUILD_DATE=$(TZ=Europe/Warsaw date +"%m%d%H%M")
AUTHOR_NAME="Mateusz Stompór"
TITLE="Projekt i Implementacja Silnika Grafiki Trójwymiarowej w Środowisku Sprzętowym Apple"
FILE_NAME="${AUTHOR_NAME} - ${TITLE} - ${BUILD_DATE}"

fail() {
  echo $1
  exit 1
}

mkdir -p ${DIST_DIR} || fail "Could not create output directories"
pdflatex -halt-on-error \
         -jobname="${FILE_NAME}" \
         -output-directory=${DIST_DIR} \
         master-s-thesis.tex 2>&1 1>/dev/null || fail "Could not build the pdf"
