#!/bin/sh

set -ev

# Remove "docs" folder from parent directory
#rm -rf ../docs

# Run bookdown
# Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook', output_dir='../docs')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book', output_dir='~/Desktop')"

# Create CNAME
# echo 'learningstatisticswithcogstat.com' > ../docs/CNAME

# Cleanup
rm -rf _bookdown_files
rm -rf _book
rm -rf lsc.log