// type of variable does not have to be explicitly typed
var a = 10, b = 3;
a = -1;
writeln("a + b = ", a + b);

var aa = a + 1.1;
writeln("aa = ", aa);

// explicitly speficy type of variables
var x: real;
var y: real = 3.121;

x = y*2.1;
writeln("x = ", x);

// data types
var myInt: int = -1000;
var myUint: uint = 1234;
var myReal: real = 1.21;
var myImag: imag = 5.0i;
var myCmplx: complex = 1 + 1.2i;
var myBool: bool = true;
var myStr: string = "This is a string";
var myStr2: string = 'This is also a string';