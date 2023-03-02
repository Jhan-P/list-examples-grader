CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission
if [ -f ListExamples.java ]
then
    echo "Found"
else
    echo "Input correct file, please"
    exit 1
fi

cp ../TestListExamples.java ./

javac ListExamples.java
if [ $? -ne 0 ]
then
    echo "ListExamples.java gave a compile error"
    exit 1
fi

javac -cp ".;../lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" TestListExamples.java
if [ $? -ne 0 ]
then
    echo "TestListExamples.java gave a compile error"
    exit 1
fi

# java -cp ".;../lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples.java > test-results.txt

# grep "Failures" test-results.txt > failures.txt
# if [ -s failures.txt ]
# then
#     echo "Failed!!!!!"
# else
#     echo "Passed!"
# fi