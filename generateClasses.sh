#!/bin/sh
source ./java_no_interface.sh
source ./java_with_interface.sh

rm -Rf $dirJavaWithInterface
mkdir -p $dirJavaWithInterface
rm -Rf $dirJavaWithInterfaceTest
mkdir -p $dirJavaWithInterfaceTest

rm -Rf $dirJavaNoInterface
mkdir -p $dirJavaNoInterface
rm -Rf $dirJavaNoInterfaceTest
mkdir -p $dirJavaNoInterfaceTest

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

factoryStart=""
factoryStartImpl=""
factoryEnd=""
testResult=""
prevClassName='A1'
# Z7 is the maximum reachable, or else kotlin resolver will fail
for index in {1..7}; do
	for letter in {A..Z}; do
		className="$letter$index"
		echo "$prevClassName -> $className"
		if [ "$className" = "Z7" ]; then
			generateClassJavaNoInterface $prevClassName $className
			generateLastClassJavaNoInterface $className
			generateClassJavaWithInterface $prevClassName $className
			generateLastClassJavaWithInterface $className
		else
			generateClassJavaNoInterface $prevClassName $className
			generateClassJavaWithInterface $prevClassName $className
		fi
		
		factoryStart="$factoryStart$className("
		factoryStartImpl="$factoryStartImpl${className}Impl("
		factoryEnd="$factoryEnd)"

		testResult="$testResult$className"
		
		prevClassName=$className
	done
done

generateFactory $dirJavaNoInterface $packageJavaNoInterface "FactoryNoInterface" "$factoryStart$factoryEnd"
generateUnitTest $dirJavaNoInterfaceTest $packageJavaNoInterface "FactoryNoInterfaceTest" $testResult

generateFactory $dirJavaWithInterface $packageJavaWithInterface "FactoryWithInterface" "$factoryStartImpl$factoryEnd"
generateUnitTest $dirJavaWithInterfaceTest $packageJavaWithInterface "FactoryWithInterfaceTest" $testResult
