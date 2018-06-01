// ref operates like a reference in C++.
// In Chapel, a ref cannot be made to alias to a variable other than
// the variable it is initialized with.
var actual = 134;
ref refToActual = actual;
writeln("actual      = ", actual);
writeln("refToActual = ", refToActual);

// modify actual
actual = -249;
writeln("actual      = ", actual);
writeln("refToActual = ", refToActual);

// modify refToActual
refToActual = 11111;
writeln("actual      = ", actual);
writeln("refToActual = ", refToActual);

