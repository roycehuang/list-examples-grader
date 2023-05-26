#set -e
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [ -e ./student-submission/ListExamples.java ]
then 
    echo "Correct file!"
    cp -r lib TestListExamples.java ./student-submission/ListExamples.java ./grading-area/
else
    echo "Wrong file!"
    exit 1
fi
javac -cp $CPATH  ./grading-area/ListExamples.java ./grading-area/TestListExamples.java
if [[ $? -ne 0 ]]
then
    echo "Compilation of student's code failed!"
    exit 1
fi

#set +e

cd grading-area
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > out.txt 2>&1
if [[ $? -ne 0 ]]
then
    cat out.txt
    exit 1
fi
    
    

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the tests
