use LinearAlgebra;
use LAPACK;
use Random;

config const N = 5;

var A = Matrix(N,N),
    B = Matrix(N,N),
    x, y = Vector(N);

fillRandom(B);
fillRandom(x);

writeln();
writeln("B = ");
writeln(B);

writeln();
writeln("x = ");
writeln(x);

y = dot(B, x);
writeln("y = dot(B,x) = ");
writeln(y);

A = outer(x,y);
writeln("A = outer(x,y) = ");
writeln(A);


