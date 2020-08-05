#!/bin/bash

echo "Arguments passed: $*"

if [ ${#@} -ne 1 ]; then
  echo "Pass the gif file name. exiting..."
  exit
fi

# removes extension from file name
file_name="${1%.*}"

# png_file="${file_name}.png"
# echo "Converting $1 to $png_file"
# convert "$1" "$png_file"

text_file="${file_name}"
echo "Extracting text from '$1' and writing it to $text_file"
tesseract "$1" "$text_file"
