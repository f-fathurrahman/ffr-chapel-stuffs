proc *(left: ?ltype, right: ?rtype): (ltype,rtype) {
  writeln("In our '*' overload");
  return (left, right);
}

writeln( 1 * "a" );
writeln( 3 * 2 );
