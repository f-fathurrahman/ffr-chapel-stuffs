module Hello {

  config const message = "Hello World by eFeFeR";

  // the entry point
  proc main() {
    writeln(message);
  }

}
