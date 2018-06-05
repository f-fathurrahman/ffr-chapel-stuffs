// `intent` modifiers on the arguments convey how those arguments are passed to
// the procedure
//
// * `in`: copy arg in, but not out
// * `out`: copy arg out, but not in
// * `inout`: copy arg in, copy arg out
// * `ref`: pass arg by reference

proc intentsProc( in inarg, out outarg, inout inoutarg, ref refarg ) {
  writeln("Inside intentsProc, before: ", (inarg, outarg, inoutarg, refarg));
  inarg = inarg + 100;
  outarg = outarg + 100;
  inoutarg = inoutarg + 100;
  refarg = refarg + 100;
  writeln("Inside intentsProc, after: ", (inarg, outarg, inoutarg, refarg));
}

var inVar: int = 1;
var outVar: int = 2;
var inoutVar: int = 3;
var refVar: int = 4;

writeln("Outside intentsProc, before: ", (inVar, outVar, inoutVar, refVar));

intentsProc(inVar, outVar, inoutVar, refVar);

writeln("Outside intentsProc, after; ", (inVar, outVar, inoutVar, refVar));


// Similarly, we can define intents on the return type.
// refElement returns a reference to an element of array
//
proc refElement( array: [?D] ?T, idx ) ref: T {
  return array[idx];
}
// XXX: Is it make sense to use intents other than `out` and `ref` ?

var myChangingArray: [1..5] int = [1,2,3,4,5];
writeln("myChangingArray = ", myChangingArray);

ref refToElem = refElement(myChangingArray, 4);
writeln("refToElem = ", refToElem);

refToElem = -2;
writeln("refToElem = ", refToElem);
writeln("myChangingArray = ", myChangingArray);

