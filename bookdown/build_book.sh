#!/bin/sh

set -ev

# Remove "docs" folder from parent directory
rm -rf ../docs

# Run bookdown
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook', output_dir='../docs')"