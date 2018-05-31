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

// some types can have size
var my8Int: int(8) = 10; // 8 bit sized int
var my64Real: real(64) = 5.31; // 64 bit sized real

writeln("my8Int = ", my8Int);
writeln("my64Real = ", my64Real);

// type casting
var intFromReal = myReal : int;
var intFromReal2: int = myReal : int;

writeln("myReal = ", myReal);
writeln("intFromReal = ", intFromReal);
writeln("intFromReal2 = ", intFromReal2);

// type aliasing
type chroma = int;
type RGBColor = 3*chroma;

var black: RGBColor = (0, 0, 0);
var white: RGBColor = (255, 255, 255);

writeln("black = ", black);
writeln("white = ", white);

