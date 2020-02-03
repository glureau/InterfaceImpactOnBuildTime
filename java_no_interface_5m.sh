#!/bin/sh

dirJavaNoInterface5m=javanointerface5m/src/main/java/com/glureau/javanointerface5m/generated
dirJavaNoInterfaceTest5m=javanointerface5m/src/test/java/com/glureau/javanointerface5m/generated
packageJavaNoInterface5m=com.glureau.javanointerface5m.generated

function generateClassJavaNoInterface5m() {
	cat > $dirJavaNoInterface5m/$1.java << EndOfClass
package $packageJavaNoInterface5m;

public class $1 {
	private final $2 m;

	public $1($2 $2) {
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

function generateLastClassJavaNoInterface5m() {
	cat > $dirJavaNoInterface5m/$1.java << EndOfClass
package $packageJavaNoInterface5m;

public class $1 {
	public String $1_1() {
		return "1_$1";
	}
	public String $1_2() {
		return "2_$1";
	}
	public String $1_3() {
		return "3_$1";
	}
	public String $1_4() {
		return "4_$1";
	}
	public String $1_5() {
		return "5_$1";
	}
}
EndOfClass
}


function regenerateLastClassJavaNoInterface5m() {
	cat > $dirJavaNoInterface5m/$1.java << EndOfClass
package $packageJavaNoInterface5m;

public class $1 {
	public String $1_1() {
		return "1_$2";
	}
	public String $1_2() {
		return "2_$2";
	}
	public String $1_3() {
		return "3_$2";
	}
	public String $1_4() {
		return "4_$2";
	}
	public String $1_5() {
		return "5_$2";
	}
}
EndOfClass
}