#!/bin/bash

# Iterate over the numbers 1 to 12
for i in {1..12}
do
    # Change into appropriate directory
    cd PS${i}
    # Call compilerClean with the appropriate .tex file
    compilerClean "PS${i}.tex"
    # Change back to parent directory
    cd ..
done