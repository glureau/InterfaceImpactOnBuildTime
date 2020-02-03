#!/bin/sh

dirJavaWithInterface5m=javawithinterface5m/src/main/java/com/glureau/javawithinterface5m/generated
dirJavaWithInterfaceTest5m=javawithinterface5m/src/test/java/com/glureau/javawithinterface5m/generated
packageJavaWithInterface5m=com.glureau.javawithinterface5m.generated

function generateClassJavaWithInterface5m() {
	cat > $dirJavaWithInterface5m/$1.java << EndOfClass
package $packageJavaWithInterface5m;

public interface $1 {
	public String $1_1();
	public String $1_2();
	public String $1_3();
	public String $1_4();
	public String $1_5();
}
EndOfClass

	cat > $dirJavaWithInterface5m/$1Impl.java << EndOfClass
package $packageJavaWithInterface5m;

public class $1Impl implements $1 {
	private final $2 m;

	public $1Impl($2 $2) {
		this.m = $2;
	}

	public String $1_1() {
		return "1_$1" + m.$2_1();
	}

	public String $1_2() {
		return "2_$1" + m.$2_2();
	}

	public String $1_3() {
		return "3_$1" + m.$2_3();
	}

	public String $1_4() {
		return "4_$1" + m.$2_4();
	}

	public String $1_5() {
		return "5_$1" + m.$2_5();
	}
}
EndOfClass
}

function generateLastClassJavaWithInterface5m() {
	cat > $dirJavaWithInterface5m/$1.java << EndOfClass
package $packageJavaWithInterface5m;

public interface $1 {
	public String $1_1();
	public String $1_2();
	public String $1_3();
	public String $1_4();
	public String $1_5();
}
EndOfClass

	cat > $dirJavaWithInterface5m/$1Impl.java << EndOfClass
package $packageJavaWithInterface5m;

public class $1Impl implements $1 {
	public String $1_1() {
		return "$1";
	}
	public String $1_2() {
		return "$1";
	}
	public String $1_3() {
		return "$1";
	}
	public String $1_4() {
		return "$1";
	}
	public String $1_5() {
		return "$1";
	}
}
EndOfClass
}


function regenerateLastClassJavaWithInterface5m() {
	cat > $dirJavaWithInterface5m/$1Impl.java << EndOfClass
package $packageJavaWithInterface5m;

public class $1Impl implements $1 {
	public String $1_1() {
		return "$2";
	}
	public String $1_2() {
		return "$2";
	}
	public String $1_3() {
		return "$2";
	}
	public String $1_4() {
		return "$2";
	}
	public String $1_5() {
		return "$2";
	}
}
EndOfClass
}
