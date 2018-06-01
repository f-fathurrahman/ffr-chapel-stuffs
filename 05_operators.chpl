//
// math operators
//
var a: int, b = 5, c = 4;

writeln("");
writeln("Math operators, using int");
writeln("");

a = b + c;
writeln(b, " + ", c, " = ", a );

a = b - c;
writeln(b, " - ", c, " = ", a );

a = b * c;
writeln(b, " * ", c, " = ", a );

a = b / c;
writeln(b, " / ", c, " = ", a );

// exponentiation
a = b**c;
writeln(b, "**", c, " = ", a );

// remainder (modulo)
a = b%c;
writeln(b, "%", c, " = ", a );

//
// Logical operators
//
var p: bool, q = false, r = true;

writeln("");
writeln("Logical operators, using bool");
writeln("");

p = q && r;
writeln(q, " && ", r, " = ", p);

p = q || r;
writeln(q, " || ", r, " = ", p);

p = !q;
writeln("!", q, " = ", p);

//
// Relation operators
//

writeln("");
writeln("Relation operators");
writeln("");

p = b > c;
writeln(b, " > ", c, " = ", p);

p = b >= c;
writeln(b, " >= ", c, " = ", p);

p = b < c;
writeln(b, " < ", c, " = ", p);

p = b <= c;
writeln(b, " <= ", c, " = ", p);

p = b != c;
writeln(b, " != ", c, " = ", p);

p = b == c;
writeln(b, " == ", c, " = ", p);

p = a < b && a >= c;
writeln(a, " < ", b, " && ", a, " >= ", c, " = ", p);

p = a < b || a >= c;
writeln(a, " < ", b, " || ", a, " >= ", c, " = ", p);

var p1 = a < b;
var p2 = a >= c;
writeln(p1);
writeln(p2);
writeln(p1 && p2);
writeln(p1 || p2);

