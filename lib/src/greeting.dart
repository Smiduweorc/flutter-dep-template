import "package:flutter/widgets.dart";

import "greet.dart";

/// Shows the result of [greet] as a single [Text].
///
/// Example widget; replace with your package's real implementation.
class Greeting extends StatelessWidget {
  /// Creates a greeting for [name].
  const Greeting(this.name, {super.key, this.greeting = "Hello"});

  /// Who is greeted.
  final String name;

  /// The salutation, `"Hello"` unless set.
  final String greeting;

  @override
  Widget build(BuildContext context) => Text(greet(name, greeting: greeting));
}
