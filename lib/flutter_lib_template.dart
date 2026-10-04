/// Public entry point. Export only what consumers need; everything under
/// `lib/src/` is private to the package unless it is re-exported here.
library;

export "src/greet.dart" show greet;
export "src/greeting.dart" show Greeting;
