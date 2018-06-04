use LinearAlgebra;
use LAPACK;
use Random;

config const N = 5;

var A = Matrix(N,N),
    B = Matrix(N,N),
    x, y = Vector(N);

fillRandom(B);
fillRandom(x);

//writeln("\nB = ");
//writeln(B);

//writeln("\nx = ");
//writeln(x);

y = dot(B, x);
//writeln("\ny = dot(B,x) = ");
//writeln(y);

A = outer(x,y);
//writeln("\nA = outer(x,y) = ");
//writeln(A);

var X = Matrix(N,1);
var Y = Matrix(N,1);

X[{1..N},1] = x[{1..N}];

//writeln("\nX = ");
//writeln(X);

A = eye(N);
//writeln("\nA = ");
//writeln(A);

var ipiv : [1..N] c_int;
Y = X;

var info = gesv(lapack_memory_order.row_major, A, ipiv, Y);

var res =+ reduce abs(x-y);

writeln(res);

