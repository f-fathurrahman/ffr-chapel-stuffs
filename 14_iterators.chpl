// Iterators are sisters to the procedure and almost everything
// about procedures also applies to iterators.
// However, instead of returning a single value, iterators may yield
// multiple values to a loop.

iter oddThenEvens(N: int): int {
  for i in 1..N by 2 do
    yield i;
  for i in 2..N by 2 do
    yield i;
}

for i in oddThenEvens(10) do write(i, ", ");
writeln();

// iterators can also yield conditionally, the result of which can be nothing
iter absolutelyNothing(N: int): int {
  for i in 1..N {
    if N < i {
      yield i; // this statement never happens
    }
  }
}

for i in absolutelyNothing(10) {
  writeln("This should never reached: ", i);
}

// We can zip together two or more iterators (who have the same number of iterations)
// using zip() to create a single zipped iterator.

for (positive, negative) in zip(1..5, -5..-1) do
  writeln("positive = ", positive, " negative = ", negative);

// zipper iteration can be used in the assignment of arrays
var fromThatArray: [1..#5] int = [1,2,3,4,5];
var toThisArray: [100..#5] int;

// some zipper operations implement other operations
// The first statement and the loop are equivalent
toThisArray = fromThatArray;
for (i,j) in zip(toThisArray.domain, fromThatArray.domain) {
  toThisArray[i] = fromThatArray[j];
}

// These two chunks are also equivalent
toThisArray = [j in -100..#5] j;
writeln("toThisArray = ", toThisArray);

for (i,j) in zip(toThisArray.domain, -100..#5) {
  toThisArray[i] = j;
}
writeln("toThisArray = ", toThisArray);




