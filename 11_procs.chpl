
// XXX use unsigned integer ?
proc fibonacci( n: int ): int {
  if n <= 1 then return n;
  return fibonacci(n-1) + fibonacci(n-2);
}

for i in 1..10 {
  writeln(i, " ", fibonacci(i));
}

// input parameters can be untyped to create a generic procedure
proc doublePrint( thing ): void {
  write(thing, " ", thing, "\n");
}

doublePrint(2);
doublePrint(2.0);
doublePrint(2.0 + 9.1i);
doublePrint("ffr");

// The return type can be inferred, as long as the compiler can figure it out.
proc addThree(n) {
  return n + 3;
}

writeln(addThree(4));
writeln(addThree(4.0));
writeln(addThree(4.0 + 0.0i));

doublePrint(addThree(fibonacci(20)));

// It is also possible to take a variable number of parameters
proc maxOf( x ...?k ) {
  // x refers to a tuple of one type, with k elements
  var maximum = x[1];
  for i in 2..k {
    maximum = if maximum < x[i] then x[i] else maximum;
  }
  return maximum;
}

writeln(maxOf(1, -10, 199, 90000, 5, 15, 422));

// procedures can have default parameter values, and the parameters
// can be named in the call, even out of order
proc defaultsProc( x: int, y: real = 1.341): (int,real) {
  return (x,y+1);
}

writeln(defaultsProc(10));
writeln(defaultsProc(x=10));
writeln(defaultsProc(10,y=10.0));
writeln(defaultsProc(y=10.0,x=10));

// The ? operator is called the query operator and is used to take undetermined
// values like tuple or array sizes and generic types.
// For example, taking arrays as parameters. The query operator is used to
// determine the domain of A. This is useful for defining the return type
// although it is not required.
proc invertArray( A: [?D] int): [D] int {
  for a in A do a = -a;
  return A;
}

var intArray = for i in 1..10 do i + 2;
writeln("intArray before = ", intArray);
writeln("invertArray(intArray) = ", invertArray(intArray));
writeln("intArray after = ", intArray);

// We can query the type of arguments to generic procedures.
// Here we define a procedure that takes two arguments of the same type,
// yet we don't define what that type is.
proc genericProc( arg1: ?valueType, arg2: valueType ): void {
  select(valueType) {
    when int do writeln(arg1, " and ", arg2, " are integers");
    when real do writeln(arg1, " and ", arg2, " are reals");
    when complex do writeln(arg1, " and ", arg2, " are complexes");
    otherwise writeln(arg1, " and ", arg2, " are something else");
  }
}

genericProc(11, 13);
genericProc(11.1, 13.1);
genericProc( 11.0 + 0.0i, 13.1 + 0.0i );
genericProc( 1..10, 3..10 );

// We can also enforce a form of polymorphism with the where clause.
// This allows the compiler to decide which function to use.
// Note: This means that all information needs to be known at compile-time.
// The `param` modifier on the arg is used to enforce this constraint.
proc whereProc( param N: int ): void where( N > 0 ) {
  writeln("N is greater than 0");
}

proc whereProc( param N: int ): void where( N < 0 ) {
  writeln("N is less than 0");
}

whereProc(11);
whereProc(-2);

// whereProc(0) will result in compiler error, unless we define the above function
// with `where( N == 0 )`

// `where` clauses can also be used to constain based on argument type
proc whereType( x: ?t ): void where t == int {
  writeln("Inside 'int' version of 'whereType': ", x);
}

proc whereType( x: ?t ): void {
  writeln("Inside generic version of 'whereType': ", x);
}


whereType(22);
whereType([1..10]);
whereType({1..10});


