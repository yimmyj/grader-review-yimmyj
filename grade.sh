CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission

echo 'Finished cloning'
cp TestListExamples.java student-submission
cp -r lib student-submission
cd student-submission
if [[ -f ListExamples.java ]];
then
echo "File found!"
else 
echo "ListExamples.java not found. Make sure it is in the right directory."
exit
fi

#javac *.java 2> compilererrors.txt

#javac -cp CPATH TestListExamples.java

javac -cp $CPATH *.java 2> CompilerErrors.txt


if [[ $? -ne 0 ]];
then 
echo "ERROR: Failed to compile"
echo "Score: 0"
exit 1
else echo "No compiler errors found!"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > JUnitFailures.txt
grep "Failures: " JUnitFailures.txt > test.txt

COUNTER=0
TOTAL_TESTS=0
FAILED=TESTS=0
for word in $(<test.txt);
do
    COUNTER=$((COUNTER+1))
    if [[ $COUNTER == 3 ]];
    then TOTAL_TESTS=$word
    fi
    if [[ $COUNTER == 5 ]];
    then FAILED_TESTS=$word
    fi
    
done

COUNTER2=0

for line in $(<JUnitFailures.txt);
do
    COUNTER2=$((COUNTER2+1))
    if [[ $COUNTER2 == 4 ]];
    then WANTED_LINE=$line
    fi
    
done

echo $WANTED_LINE

NUMERRORS=$(($(grep -o "E" <<<"$WANTED_LINE" | wc -l)-0))
NUMTESTS=$(($(grep -o "." <<<"$WANTED_LINE" | wc -l)-$NUMERRORS))
NUMSUCCESS=$(($NUMTESTS-$NUMERRORS))
GRADE=$(($(($NUMTESTS-$NUMERRORS))*$((100/$NUMTESTS))))

if [[ $NUMERRORS == 0 ]]; then echo "You've passed all test cases. Your grade is 100."
else
echo "You passed $NUMSUCCESS tests and failed $NUMERRORS tests. Your grade is $GRADE."
fi
