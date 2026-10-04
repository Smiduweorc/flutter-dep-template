import "package:flutter/widgets.dart";
import "package:flutter_lib_template/flutter_lib_template.dart";
import "package:flutter_test/flutter_test.dart";

// Text needs an ambient text direction; an app would get it from MaterialApp
// or WidgetsApp, and the package must not depend on either.
Widget host(Widget child) =>
    Directionality(textDirection: TextDirection.ltr, child: child);

void main() {
  testWidgets("renders the default greeting", (tester) async {
    await tester.pumpWidget(host(const Greeting("world")));
    expect(find.text("Hello, world!"), findsOneWidget);
  });

  testWidgets("renders a custom greeting", (tester) async {
    await tester.pumpWidget(host(const Greeting("world", greeting: "Hi")));
    expect(find.text("Hi, world!"), findsOneWidget);
  });

  testWidgets("rebuilds when the name changes", (tester) async {
    await tester.pumpWidget(host(const Greeting("world")));
    await tester.pumpWidget(host(const Greeting("there")));
    expect(find.text("Hello, there!"), findsOneWidget);
    expect(find.text("Hello, world!"), findsNothing);
  });
}
