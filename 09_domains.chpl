// Rectangular domains are defines using the same range syntax
// but they are required to be bounded.
var domain1to10: domain(1) = {1..10};
var twoDimensions: domain(2) = {-2..2,0..2};
var thirdDim: range = 1..16;
var threeDims: domain(3) = {thirdDim, 1..10, 5..10};

writeln("domain1to10 = ", domain1to10);
writeln("twoDimensions = ", twoDimensions);
writeln("threeDims = ", threeDims);

// Domains can be resized
var resizedDom = {1..10};
writeln("Before, resizedDom = ", resizedDom);
resizedDom = {-10..#10};
writeln("After, resizedDom = ", resizedDom);

// indices can be iterated over as tuples
for idx in twoDimensions do
  write(idx, ", ");
writeln();

// these tuples can also be deconstructed
for (x,y) in twoDimensions {
  write("(", x, ", ", y, "), ");
}
writeln();

// associative domains act like sets
var stringSet: domain(string); // empty set of strings
stringSet += "a";
stringSet += "b";
stringSet += "c";
stringSet += "d";
stringSet += "1";
stringSet += "?";
stringSet += "a";
stringSet -= "c";
writeln(stringSet.sorted());

// associative domains can also have a literal syntax
var intSet = {1, 2, 5, 7, 112};

// both ranges and domains can be sliced to produce a range or domain with the
// intersection of indices
var rangeA = 1.. ;
var rangeB = ..5 ;
var rangeC = rangeA[rangeB];
//
writeln("rangeA = ", rangeA);
writeln("rangeB = ", rangeB);
writeln("rangeC = ", rangeC);

var domainA = {1..10, 5..20};
var domainB = {-5..5, 1..10};
var domainC = domainA[domainB];
//
writeln("domainA = ", domainA);
writeln("domainB = ", domainB);
writeln("domainC = ", domainC);



