if 100 < 100 then
  writeln("All is well");


if -1 < 1 then
  writeln("Continue to believe in reality");
else
  writeln("Something is wrong");


// parenthesis can be used
if( 10 > 100 ) {
  writeln("Universe is broken");
}

var a = 4;
if a % 2 == 0 {
  writeln(a, " is even");
}
else {
  writeln(a, " is odd");
}

if( a % 3 == 0 ) {
  writeln(a, " is even divisible by 3");
}
else if( a % 3 == 1 ) {
  writeln(a, " is divided by 3 with remainder of 1");
}
else {
  writeln(a, " is divided by 3 with remainder of 2");
}

// ternary
var ii = 3, jj = 5;
var maximum = if ii < jj then jj else ii;
writeln("maximum = ", maximum);

// select statement do not cascade like in C or Java
var inputOption = "anOption1";
select inputOption {
  when "anOption" do writeln("Chose 'anOption'");
  when "otherOption" {
    writeln("Chose 'otherOption'");
    writeln("Which has a body");
  }
  otherwise {
    writeln("Any other input");
    writeln("The otherwise case does not need a do if the body is one line");
  }
}


