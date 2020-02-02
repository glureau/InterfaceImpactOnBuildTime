#!/bin/sh

dirJavaNoInterface=javanointerface/src/main/java/com/glureau/javanointerface/generated
dirJavaNoInterfaceTest=javanointerface/src/test/java/com/glureau/javanointerface/generated
packageJavaNoInterface=com.glureau.javanointerface.generated

function generateClassJavaNoInterface() {
	cat > $dirJavaNoInterface/$1.java << EndOfClass
package $packageJavaNoInterface;

public class $1 {
	private final $2 m;

	public $1($2 $2) {
		this.m = $2;
	}

	public String $1() {
		return "$1" + m.$2();
	}
}
EndOfClass
}

function generateLastClassJavaNoInterface() {
	cat > $dirJavaNoInterface/$1.java << EndOfClass
package $packageJavaNoInterface;

public class $1 {
	public String $1() {
		return "$1";
	}
}
EndOfClass
}


function regenerateLastClassJavaNoInterface() {
	cat > $dirJavaNoInterface/$1.java << EndOfClass
package $packageJavaNoInterface;

public class $1 {
	public String $1() {
		return "$2";
	}
}
EndOfClass
}