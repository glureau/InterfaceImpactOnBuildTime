#!/bin/sh
source ./java_no_interface.sh
source ./java_no_interface_5m.sh
source ./java_with_interface.sh
source ./java_with_interface_5m.sh

rm -Rf $dirJavaWithInterface
mkdir -p $dirJavaWithInterface
rm -Rf $dirJavaWithInterfaceTest
mkdir -p $dirJavaWithInterfaceTest

rm -Rf $dirJavaWithInterface5m
mkdir -p $dirJavaWithInterface5m
rm -Rf $dirJavaWithInterfaceTest5m
mkdir -p $dirJavaWithInterfaceTest5m

rm -Rf $dirJavaNoInterface
mkdir -p $dirJavaNoInterface
rm -Rf $dirJavaNoInterfaceTest
mkdir -p $dirJavaNoInterfaceTest

rm -Rf $dirJavaNoInterface5m
mkdir -p $dirJavaNoInterface5m
rm -Rf $dirJavaNoInterfaceTest5m
mkdir -p $dirJavaNoInterfaceTest5m

function generateFactory() {
	cat > $1/$3.kt << EndOfClass
package $2

object $3 {
	fun create() = $4
}
EndOfClass
}

function generateUnitTest() {
	cat > $1/$3.kt << EndOfClass
package $2

import org.junit.Assert
import org.junit.Test

class $3 {
	@Test
	fun test() {
		Assert.assertEquals("$4", ${3::-4}.create().A1())
	}
}
EndOfClass
}

function generateUnitTest5m() {
	cat > $1/$3.kt << EndOfClass
package $2

import org.junit.Assert
import org.junit.Test

class $3 {
	@Test
	fun test() {
		Assert.assertEquals("$4", ${3::-4}.create().A1_1())
		Assert.assertEquals("$5", ${3::-4}.create().A1_2())
		Assert.assertEquals("$6", ${3::-4}.create().A1_3())
		Assert.assertEquals("$7", ${3::-4}.create().A1_4())
		Assert.assertEquals("$8", ${3::-4}.create().A1_5())
	}
}
EndOfClass
}

factoryStart=""
factoryStartImpl=""
factoryEnd=""
testResult=""
testResult5m1=""
testResult5m2=""
testResult5m3=""
testResult5m4=""
testResult5m5=""
prevClassName='A1'
# Z7 is the maximum reachable, or else kotlin resolver will fail
for index in {1..7}; do
	for letter in {A..Z}; do
		className="$letter$index"
		echo "$prevClassName -> $className"

		generateClassJavaNoInterface $prevClassName $className
		generateClassJavaNoInterface5m $prevClassName $className
		generateClassJavaWithInterface $prevClassName $className
		generateClassJavaWithInterface5m $prevClassName $className

		if [ "$className" = "Z7" ]; then
			generateLastClassJavaNoInterface $className
			generateLastClassJavaNoInterface5m $className
			generateLastClassJavaWithInterface $className
			generateLastClassJavaWithInterface5m $className
		fi
		
		factoryStart="$factoryStart$className("
		factoryStartImpl="$factoryStartImpl${className}Impl("
		factoryEnd="$factoryEnd)"

		testResult="$testResult$className"
		testResult5m1="${testResult5m1}1_$className"
		testResult5m2="${testResult5m2}2_$className"
		testResult5m3="${testResult5m3}3_$className"
		testResult5m4="${testResult5m4}4_$className"
		testResult5m5="${testResult5m5}5_$className"
		
		prevClassName=$className
	done
done

generateFactory $dirJavaNoInterface $packageJavaNoInterface "FactoryNoInterface" "$factoryStart$factoryEnd"
generateUnitTest $dirJavaNoInterfaceTest $packageJavaNoInterface "FactoryNoInterfaceTest" $testResult

generateFactory $dirJavaNoInterface5m $packageJavaNoInterface5m "FactoryNoInterface5m" "$factoryStart$factoryEnd"
generateUnitTest5m $dirJavaNoInterfaceTest5m $packageJavaNoInterface5m "FactoryNoInterface5mTest" $testResult5m1 $testResult5m2 $testResult5m3 $testResult5m4 $testResult5m5

generateFactory $dirJavaWithInterface $packageJavaWithInterface "FactoryWithInterface" "$factoryStartImpl$factoryEnd"
generateUnitTest $dirJavaWithInterfaceTest $packageJavaWithInterface "FactoryWithInterfaceTest" $testResult

generateFactory $dirJavaWithInterface5m $packageJavaWithInterface5m "FactoryWithInterface5m" "$factoryStartImpl$factoryEnd"
generateUnitTest5m $dirJavaWithInterfaceTest5m $packageJavaWithInterface5m "FactoryWithInterface5mTest" $testResult5m1 $testResult5m2 $testResult5m3 $testResult5m4 $testResult5m5
