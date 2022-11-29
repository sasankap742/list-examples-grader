# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission

echo "---------Grading started----------"
echo "//////////////////////////////////"

GRADE=0;

#junit jar
CP='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
if [[ -e student-submission/ListExamples.java ]]; then
        echo "Correct file name and path"
        cp student-submission/ListExamples.java . 
        javac -cp $CP ListExamples.java TestListExamples.java
        if [[ $? -eq 0 ]]; then
                echo "Compile Sucessful"
                #No grade points for compile alone
                java -cp $CP org.junit.runner.JUnitCore TestListExamples 1> TestErr.txt
                if grep -q "testMerge2ListsInOrder" TestErr.txt; then
                        echo "testMerge2ListInOrder Failed"
                else
                        echo "testMerge2ListInOrder Passed Grade +1"
                        GRADE=$((GRADE + 1))
                fi
                if grep -q "testMerge2ListsOutOfOrder" TestErr.txt; then
                        echo "testMerge2ListsOutOfOrder Failed"
                else
                        echo "testMerge2ListOutOfOrder Passed Grade +1"
                        GRADE=$(( GRADE + 1 ))
                fi
                if grep -q "testMergeListsDuplicateReferenceItems" TestErr.txt; then
                        echo "testMergeListsDuplicateReferenceItems Failed"
                else
                        echo "testMergeListsDuplicateReferenceItems Passed Grade +1"
                        GRADE=$(( GRADE + 1 ))
                fi
                if grep -q "testFilter" TestErr.txt; then
                        echo "testFilter Failed"
                else
                        echo "testFilter Passed Grade +1"
                        GRADE=$(( GRADE + 1))
                fi


        else
                echo "There are Compile Errors"
                #Grade should be zero  
        fi

else
        echo "File name or path are incorrect, File not found"
        #Grade should be zero
fi

echo "Final Grade for the Submission----"
echo "Grade = ${GRADE}/4"
                                                           
