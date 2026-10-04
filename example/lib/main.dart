import "package:flutter/widgets.dart";
import "package:flutter_lib_template/flutter_lib_template.dart";

void main() {
  runApp(
    const Directionality(
      textDirection: TextDirection.ltr,
      child: Center(child: Greeting("world")),
    ),
  );
}
