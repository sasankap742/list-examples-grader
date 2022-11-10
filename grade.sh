# Create your grading script here

set -e

rm -rf student-submission
git clone $1 student-submission

#junit jar
CP = "lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar"

javac -cp $CP*.java

java -cp $CP org.junit.runner.JunitCore TestListExamples

