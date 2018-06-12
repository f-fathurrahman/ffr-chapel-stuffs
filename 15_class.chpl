// Classes are allocated on the heap

class MyClass {
  // member variables
  var memberInt: int;
  var memberBool: bool = true;

  // Explicitly defined initializer
  // We also get the compiler-generated initializer, with one argument per field.
  // Note that soon there will be no compiler-generated initializer when we define
  // any initializer(s) explicitly
  proc MyClass( val: real ) {
    this.memberInt = ceil(val): int;
  }

  // Explicitly defined deinitializer
  // If we did not write one, we would get the compiler-generated deinitializer.
  // which has an empty body
  proc deinit() {
    writeln("MyClass deinitializer is called: ", (this.memberInt, this.memberBool));
  }

  proc setMemberInt( val: int ) {
    this.memberInt = val;
  }

  proc setMemberBool( val: bool ) {
    this.memberBool = val;
  }

  proc getMemberBool(): bool {
    return this.memberBool;
  }

  proc getMemberInt(): int {
    return this.memberInt;
  }

}

// Call the compiler-generated initializer, using default value for memberBool
var myObject1 = new MyClass(10);
var myObject2 = new MyClass(memberInt=10, memberBool=false);

writeln("myObject1 = ", myObject1);
writeln("myObject2 = ", myObject2);

// Call the initializer we wrote
var myOtherObject1 = new MyClass(1.95);
var myOtherObject2 = new MyClass(val=1.95);
writeln("myOtherObject1 = ", myOtherObject1);
writeln("myOtherObject2 = ", myOtherObject2);

// We can define an operator on our class as well, but the definition
// has to be outside the class definition
proc +(A: MyClass, B:MyClass): MyClass {
  var ri = A.getMemberInt() + B.getMemberInt();
  var rb = A.getMemberBool() || B.getMemberBool();
  return new MyClass(memberInt=ri, memberBool=rb);
}

var plusObj = myObject1 + myOtherObject1;

writeln("plusObj = ", plusObj);

delete myObject1;
delete myObject2;
delete myOtherObject1;
delete myOtherObject2;
delete plusObj;

// Classes can inherit one or more parent classes
class MyChildClass: MyClass {
  var memberComplex: complex;
}

var childObj = new MyChildClass(memberComplex=(3.2+9.9i));
writeln("childObj = ", childObj);

// Here is an example of generic classes
class GenericClass {
  type classType;
  var classDomain: domain(1);
  var classArray: [classDomain] classType;

  // explicit constructor
  proc GenericClass( type classType, elements: int ) {
    this.classDomain = {1..#elements};
  }

  // copy constructor
  // Note: We still have to put the type as an argument, but we can default to the
  // type of the other object using the query (?) operator.
  // Further, we can take advantage of this to allow our copy constructor
  // top copy classes of different types and cast on the fly
  proc GenericClass( other: GenericClass(?otherType), type classType = otherType ) {
    this.classDomain = other.classDomain;
    // copy and cast
    for idx in this.classDomain {
      this[idx] = other[idx]: classType;
    }
  }
  
  // Define bracket notation on a GenericClass object
  // so it can behave like a normal array
  proc this(i: int) ref: classType {
    return this.classArray[i];
  }

  // Define an implicit iterator for the class to yield value
  // from the array to a loop
  iter these() ref: classType {
    for i in this.classDomain do yield this[i];
  }

}

