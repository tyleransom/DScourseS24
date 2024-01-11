#!/bin/sh
for i in $(seq 1 17); do
    echo "user $i"
    points=0
    j=$(printf "%03d" $i)
    cd /home/ouecon${j}
    
    # 2 -- set up ssh key
    if  [ "$(ls -A .ssh 2> /dev/null)" ]; then
        points=$((points + 5))
    elif [ $? -ne 0 ]; then
        echo "Error with ls command for .ssh directory"
    else
        echo "Did not set up ssh key"
    fi
    
    # 3-4 -- cloned repository
    if [ -d "DScourseS24" ]; then
        points=$((points + 5))
    else
        echo "Directory named 'DScourseS24' does not exist"
    fi
    
    # 5 -- .tex file in PS2 folder
    if ls /home/ouecon${j}/DScourseS24/ProblemSets/PS2/*_*.tex 1> /dev/null 2>&1; then
        points=$((points + 5))
    else
        echo "tex file does not exist"
    fi
        
    # 6 -- .pdf file in PS2 folder
    if ls /home/ouecon${j}/DScourseS24/ProblemSets/PS2/*_*.pdf 1> /dev/null 2>&1; then
        points=$((points + 5))
    else
        echo "pdf file does not exist"
    fi
    
    # 7
    
    # 8
    
    # 9 -- updated bash profile file with newer R version
    if grep -q "foss" .bash_profile; then
        points=$((points + 5))
    else
        echo ".bash_profile does not contain the string 'foss'"
    fi

    # 10 -- R directory (i.e. has installed R packages)
    if [ -d "R" ]; then
        points=$((points + 5))
    else
        echo "Directory named 'R' does not exist"
    fi
    echo "Total points: $points"
    echo " "
done

