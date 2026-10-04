import "package:flutter_lib_template/flutter_lib_template.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  test("greets with the default greeting", () {
    expect(greet("world"), "Hello, world!");
  });

  test("honors a custom greeting", () {
    expect(greet("world", greeting: "Hi"), "Hi, world!");
  });

  test("an empty custom greeting is used as-is, not defaulted", () {
    expect(greet("world", greeting: ""), ", world!");
  });

  test("an empty name still produces a greeting", () {
    expect(greet(""), "Hello, !");
  });

  test("non-ASCII names pass through unchanged", () {
    expect(greet("Åsa"), "Hello, Åsa!");
  });
}
