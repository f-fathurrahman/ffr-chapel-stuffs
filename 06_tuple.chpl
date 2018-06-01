// tuples can be of the same type or different types
var sameTup: 2*int = (11, -34);
var sameTup2 = (11, 3);
var diffTup: (int,real,complex) = (4, 3.123, 5.6 + 3.1i);
var diffTup2 = (4, 3.11, 4.5 + 0.5i);

writeln("sameTup = ", sameTup);
writeln("sameTup2 = ", sameTup2);
writeln("diffTup = ", diffTup);
writeln("diffTup2 = ", diffTup2);

// tuple can be accessed using square bracket or parantheses and
// are 1-indexed
writeln("sameTup by indices: ", sameTup[1], sameTup[2]);

// tuple can be written (mutable!)
diffTup[1] = -111;
writeln("diffTup = ", diffTup);

// tuple can be expanded
var (tupInt, tupReal, tupCmplx) = diffTup;

// tuple can be used for writing a list of variables
var a = 1, b = 1.3, c = 4.5 + 1.34i, p = false;
writeln( (a, b, c, p) );

