#!/bin/bash

shopt -s extglob

cd ../../../stud-repo-DS24/

# sync everyone's changes
for folder in */; do
    # Change into the folder
    cd ${folder}/DScourseS24
    
    git pull origin master

    # Change back to the original directory
    cd "$OLDPWD"
done


# Define a temporary file
dir_path="../../../../../DScourseS24/ProblemSets/PS1/"
tmp_file=PS1_output.txt

# Loop over all folders in the current directory
for folder in */; do
    echo "user $folder"
    # Change into the folder
    cd ${folder}/DScourseS24/ProblemSets/PS1

    # Cat the contents of any .tex or .txt file not named PS1.tex into the temporary file
    echo "*********************************************************************" >> "${dir_path}${tmp_file}"
    echo "user $folder" >> "${dir_path}${tmp_file}"
    echo "*********************************************************************" >> "${dir_path}${tmp_file}"
    echo "" >> "${dir_path}${tmp_file}"
    echo "" >> "${dir_path}${tmp_file}"
    #cat !(PS1.tex|*.pdf).@(tex|txt) >> "${dir_path}${tmp_file}"
    cat !(PS1.tex|*.pdf) >> "${dir_path}${tmp_file}"
    #cat !(PS1|*.pdf)@(tex|txt) >> "${dir_path}${tmp_file}"
    echo "" >> "${dir_path}${tmp_file}"
    echo "" >> "${dir_path}${tmp_file}"
    echo "" >> "${dir_path}${tmp_file}"
    echo "" >> "${dir_path}${tmp_file}"

    # Change back to the original directory
    cd "$OLDPWD"
done

# Change back to directory where this script lives
cd ../DScourseS24/ProblemSets/PS1
