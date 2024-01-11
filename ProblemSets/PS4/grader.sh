#!/bin/sh
for i in $(seq 1 17); do
    echo ""
    echo ""
    echo "---------------------------------------------------"
    echo ""
    echo ""
    echo "user $i"
    points=5
    j=$(printf "%03d" $i)
    cd /home/ouecon${j}
    
    # 2 -- is fork synced? (can't check this here)
    
    # 3 -- does ~/bin folder exist?
    if [ -d "/home/ouecon${j}/bin" ]; then
        points=$((points + 5))
        echo ""
        echo ""
    else
        echo "bin directory does not exist"
    fi
    
    # 4 -- does .bash_profile add the module for Spark 2.0.0?
    if grep -q "module load Spark/2.0.0" "/home/ouecon${j}/.bash_profile"; then
        points=$((points + 5))
        echo ""
        echo ""
    else
        echo ".bash_profile file not set up properly"
    fi

    # 5 -- PS4a_* file
    if ls /home/ouecon${j}/DScourseS24/ProblemSets/PS4/PS4a_* 1> /dev/null 2>&1; then
        points=$((points + 10))
        head -15 /home/ouecon${j}/DScourseS24/ProblemSets/PS4/PS4a_* | tail -4
        echo ""
        echo ""
    else
        echo "No PS4a_* file"
    fi

    # 6 -- PS4b_* file
    if ls /home/ouecon${j}/DScourseS24/ProblemSets/PS4/PS4b_* 1> /dev/null 2>&1; then
        points=$((points + 10))
        head -7 /home/ouecon${j}/DScourseS24/ProblemSets/PS4/PS4b_* | tail -4
        echo ""
        echo ""
    else
        echo "No PS4b_* file"
    fi

    # 7 -- .tex file in PS4 folder
    if ls /home/ouecon${j}/DScourseS24/ProblemSets/PS4/*_*.tex 1> /dev/null 2>&1; then
        points=$((points + 5))
        tail /home/ouecon${j}/DScourseS24/ProblemSets/PS4/*_*.tex
        echo ""
        echo ""
    else
        echo "tex file does not exist"
    fi
        
    # 7 -- .pdf file in PS4 folder
    if ls /home/ouecon${j}/DScourseS24/ProblemSets/PS4/*_*.pdf 1> /dev/null 2>&1; then
        points=$((points + 5))
    else
        echo "pdf file does not exist"
    fi

    echo " "
    echo " "
    echo "Total points: $points"
    echo " "
done
