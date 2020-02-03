#!/bin/sh
source ./java_no_interface.sh
source ./java_no_interface_5m.sh
source ./java_with_interface.sh
source ./java_with_interface_5m.sh

echo ------------------------------- CLEAN FIRST BUILD
./gradlew clean compileDebugJavaWithJavac

echo ------------------------------- ITERATIVE BUILD - NO CHANGE
for attempt in {1..10}; do
	time ./gradlew compileDebugJavaWithJavac
done

echo ------------------------------- ITERATIVE BUILD - CHANGE Z - NO INTERFACE
for attempt in {1..10}; do
	regenerateLastClassJavaNoInterface5m "Z7" "Z7-$attempt"
	time ./gradlew compileDebugJavaWithJavac
done

echo ------------------------------- ITERATIVE BUILD - NO CHANGE
for attempt in {1..2}; do
	time ./gradlew compileDebugJavaWithJavac
done

echo ------------------------------- ITERATIVE BUILD - CHANGE Z - WITH INTERFACE
for attempt in {1..10}; do
	regenerateLastClassJavaWithInterface5m "Z7" "Z7-$attempt"
	time ./gradlew compileDebugJavaWithJavac
done
