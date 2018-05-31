// this value cannot be changed after set in runtime
const almostPi: real = 22.0/7.0;

// A param is a constant whose value must be known statically at
// compile-time
param compileTimeConst: int = 18;

// config modifier allows values to be set at the command line.
// set with --varCmdLineArg=Value or --varCmdLineArg Value at runtime.
config var varCmdLineArg: int = 231;
config const constCmdLineArg: int = 999;

// config param can be set at compile time
// set with --set paramCmdLineArg=value
config param paramCmdLineArg: bool = false;

writeln("varCmdLineArg = ", varCmdLineArg);
writeln("constCmdLineArg = ", constCmdLineArg);
writeln("paramCmdLineArg = ", paramCmdLineArg);



