// Ranges and Domains

// for-loops and arrays both use ranges and domains to define an index set that
// can be iterated over.
// Ranges are 1-D dimensional integer indices, while domains can be multidimensional
// and represent indices of different types.

// ranges and domains are first-class types and can be assigned into variables.
var range1to10: range = 1..10;
var range2to11: range = 2..11;
var A: int = 10;
var B: int = 25;
var rangeAtoB: range = A..B;

// This is valid by contains no indices
var rangeEmpty: range = 10..-10;

writeln("rangeAtoB = ", rangeAtoB);
writeln("rangeEmpty = ", rangeEmpty);

// ranges can be unbounded
var range1toInf: range(boundedType=BoundedRangeType.boundedLow) = 1.. ;
var rangeNegInfTo1: range(boundedType=BoundedRangeType.boundedHigh) = ..1;

writeln("range1toInf = ", range1toInf);
writeln("rangeNegInfto1 = ", rangeNegInfTo1);

// Ranges can be strided and reversed using the by operator
var range2to10by2: range(stridable=true) = 2..10 by 2;
var reverse2to10by2 = 2..10 by -2;  // notice the syntax

// this is still an empty range
var trapRange = 10..1 by -1;

writeln("range2to10by2 in for loop");
for i in range2to10by2 {
  write(" ", i);
}
writeln();

writeln("reverse2to10by2 in for loop");
for i in reverse2to10by2 {
  write(" ", i);
}
writeln();

writeln("trapRange in for loop");
for i in trapRange {
  write(" ", i);
}
writeln();

// The end point of a range can be determined using the count (#) operator.
var rangeCount: range = -5..#12;
writeln("rangeCount in for loop");
for i in rangeCount {
  write(" ", i);
}
writeln();

var rangeCountBy: range(stridable=true) = -5..#12 by 2;
writeln("rangeCountBy in for loop");
for i in rangeCountBy {
  write(" ", i);
}
writeln();

// Properties of range can be queried

writeln("rangeCountBy.first  = ", rangeCountBy.first);
writeln("rangeCountBy.last   = ", rangeCountBy.last);
writeln("rangeCountBy.length = ", rangeCountBy.length);
writeln("rangeCountBy.stride = ", rangeCountBy.stride);

writeln("rangeCountBy.member(-1) = ", rangeCountBy.member(-1));
writeln("rangeCountBy.member(10) = ", rangeCountBy.member(10));

for i in rangeCountBy {
  write(i, if i == rangeCountBy.last then "\n" else ", ");
}


