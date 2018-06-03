// Arrays are similar to those of other languages
// Their sizes are defined using domains that represent their indices

var intArray: [1..10] int;
var intArray2: [{1..10}] int; // equivalent

// Arrays can be accessed using either brackets or parentheses
for i in 1..10 {
  intArray[i] = -i + 2;
}
writeln("intArray = ", intArray);

// intArray[0] and intArray[11] can not be accessed because they are not
// in the index set, {1..10}, we defined it to have.

var realDomain: domain(2) = {1..5, 1..7};
var realArray: [realDomain] real;
var realArray2: [1..5,1..7] real; // equivalent

// Elements of realArray are initialized to zeros.
writeln("Before setup: realArray = ");
writeln(realArray);

for i in 1..5 {
  for j in realDomain.dim(2) {
    realArray[i,j] = 1.53*i + 0.4*j; // access using index list
    var idx: 2*int = (i,j);
    realArray[idx] = -realArray[(i,j)]; // index using tuples
  }
}
writeln("After setup: realArray = ");
writeln(realArray);

// arrays have domains as members, and can be iterated over as normal
for idx in realArray.domain {
  realArray[idx] = 1/realArray[idx[1],idx[2]];
}
writeln("After inverting: realArray = ");
writeln(realArray);

// The values of an array can also be iterated directly
var rSum: real = 0.0;
for value in realArray {
  writeln();
  writeln("value up = ", value);
  rSum = rSum + value;
  value = rSum; // this `value` is local variable, it is different from value in `for value`
  writeln("rSum = ", rSum);
  writeln("value bottom = ", value);
}
writeln("rSum = ", rSum);

// associative arrays (dictionaries) can be created using associative domains
var dictDomain: domain(string) = {"one", "two"};
var dict: [dictDomain] int = ["one" => 1, "two" => 2];
// new element can be added
dict["three"] = 3;
writeln();
for key in dictDomain.sorted() do
  writeln(key, " ", dict[key]);

// arrays can be assigned to each other in a few different ways.

var thisArray: [0..5] int = [0,1,2,3,4,5];
var thatArray: [0..5] int;

// Assign one to the other. This copies `thisArray` into thatArray
// instead of just creating a reference.
thatArray = thisArray;
thatArray[1] = -99;
writeln();
writeln("thisArray = ", thisArray);
writeln("thatArray = ", thatArray);

// assign a slice from one array to a slice (of the same size) in the other
thatArray[4..5] = thisArray[1..2];
writeln();
writeln("thisArray = ", thisArray);
writeln("thatArray = ", thatArray);

// operations can also be promoted to work on arrays
var thisPlusThat = thisArray + thatArray;
writeln();
writeln("thisArray + thatArray = ", thisPlusThat);

// arrays and loops can also be expressions, where the loop body expression
// is the result of each iteration
var arrayFromLoop = for i in 1..10 do i;
writeln();
writeln("arrayFromLoop = ", arrayFromLoop);

// an expression can result in nothing, such as when filtering with an if-expression
var evensOrFives = for i in 1..10 do if (i % 2 == 0 || i % 5 == 0) then i;
writeln();
writeln("evensOrFives = ", evensOrFives);

// array expression can also be written with a bracket notation
// this syntax uses the forall parallel concept
var evensOrFivesAgain = [i in 1..10] if (i % 2 == 0 || i % 5 == 0) then i;
writeln();
writeln("evensOrFivesAgain = ", evensOrFivesAgain);

// Arrays can also be written over the values of the array
arrayFromLoop = [value in arrayFromLoop] value + 1;
writeln();
writeln("arrayFromLoop = ", arrayFromLoop);

