#!/bin/sh

set -ev

# Define variables
type=$1
optnsprompt=("[0] bookdown::gitbook" "[2] bookdown::pdf_book")
savlocinput=$2
savlocprompt=("[0] Project home: output_dir='../docs'" "[d] output_dir='~/Desktop'")

# If user chose 0 as the save location, set the save location to the project home, if d, then set to desktop
if [ $savlocinput = 0 ]
then
    savloc="../docs"
    # Remove "docs" folder from parent directory
    echo "Removing the original docs project folder from the parent directory"
    rm -rf ../docs

elif [ $savlocinput = d ]
then
    savloc="~/Desktop"
fi


# If user input 0, build gitbook, if 2 then build pdf. If savloc is 0 save to , if d then 
if [ $type -eq 0 ]
then
  echo "Building gitbook"
  Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook', output_dir='$savloc')"
  # Create CNAME
  echo 'learningstatisticswithcogstat.com' > ../docs/CNAME
  echo "Gitbook built at $savloc"
elif [ $type -eq 2 ]
then
  echo "Building pdf"
  Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', output_dir='$savloc')"
  echo "PDF built at $savloc"
else
  echo "Invalid input"
  echo "Please choose one of the following options:"
    echo "${optnsprompt[@]}"
    echo "${savlocprompt[@]}"
fi

echo "Performing cleanup"

# Cleanup
rm -rf _bookdown_files
rm -rf _book
rm -rf lsc.log