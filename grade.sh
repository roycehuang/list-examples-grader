#set -e
CPATH = '.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [ -e ./student-submission/ListExamples.java ]
then 
    echo "Correct file!"
    cp -r ./student-submission/ListExamples.java ./grading-area/
else
    echo "Wrong file!"
    exit 1
fi

if ! javac -cp $CPATH -d ./student-submission/TestListExamples.java
then
    echo 'Compilation of tests failed!'
    exit 1
fi

if ! javac -cp $CPATH -d ./grading-area/ListExamples.java
then
    echo "Compilation of student's code failed!"
    exit 1
fi

# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
