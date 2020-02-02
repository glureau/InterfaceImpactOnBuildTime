#!/bin/sh

dirJavaWithInterface=javawithinterface/src/main/java/com/glureau/javawithinterface/generated
dirJavaWithInterfaceTest=javawithinterface/src/test/java/com/glureau/javawithinterface/generated
packageJavaWithInterface=com.glureau.javawithinterface.generated

function generateClassJavaWithInterface() {
	cat > $dirJavaWithInterface/$1.java << EndOfClass
package $packageJavaWithInterface;

public interface $1 {
	public String $1();
}
EndOfClass

	cat > $dirJavaWithInterface/$1Impl.java << EndOfClass
package $packageJavaWithInterface;

public class $1Impl implements $1 {
	private final $2 m;

	public $1Impl($2 $2) {
		this.m = $2;
	}

	public String $1() {
		return "$1" + m.$2();
	}
}
EndOfClass
}

function generateLastClassJavaWithInterface() {
	cat > $dirJavaWithInterface/$1.java << EndOfClass
package $packageJavaWithInterface;

public interface $1 {
	public String $1();
}
EndOfClass

	cat > $dirJavaWithInterface/$1Impl.java << EndOfClass
package $packageJavaWithInterface;

public class $1Impl implements $1 {
	public String $1() {
		return "$1";
	}
}
EndOfClass
}


function regenerateLastClassJavaWithInterface() {
	cat > $dirJavaWithInterface/$1Impl.java << EndOfClass
package $packageJavaWithInterface;

public class $1Impl implements $1 {
	public String $1() {
		return "$2";
	}
}
EndOfClass
}
