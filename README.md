# flutter_lib_template

A template for a Flutter package that other apps depend on, with strict
analysis, tests, an example app, `dart doc` on GitHub Pages and a changelog
built from commit messages. CI runs on Linux, macOS and Windows against
Flutter 3.47 and the latest stable.

## Starting from it

Requires Flutter 3.47 or later, plus `lefthook` and `git-cliff` on your
`PATH`.

1. Copy the directory, then run `git init`, `lefthook install` and
   `flutter pub get`.
2. Rename the package: `name` in `pubspec.yaml` and `example/pubspec.yaml`, the
   entry point `lib/flutter_lib_template.dart`, and every
   `package:flutter_lib_template/` import. Update `description` and
   `repository` too.
3. Replace `lib/src/greet.dart` and `lib/src/greeting.dart`, and the `export`
   lines in the entry point. Anything in `lib/src/` that is not exported stays
   private. Tests go under `test/` as `*_test.dart`.

`example/` depends on the package by path and CI analyzes it, so an export
missing from the entry point fails the build. There is no publish workflow;
run `flutter pub publish` yourself.

Commits follow Conventional Commits and `./release.sh v1.2.0` cuts a release;
[black-garden-ants](https://github.com/Smiduweorc/black-garden-ants) explains
both. Here the commit check is `tool/check-commit-msg.sh`, so a Dart package
needs no Node, and this `release.sh` is an older one that takes only an
explicit version.

## Known quirks

- `dart format` always indents with two spaces and has no option for tabs, so
  this repo does not use tabs.
- CI skips the publish dry run while `version` is `0.0.0`, because pub rejects
  a changelog with no entry for the current version. It runs from the first
  release onwards.
- `pubspec.lock` is not committed, as is usual for a library: CI resolves the
  newest versions the ranges allow, which is what a consuming app gets.
- `flutter analyze` exits non-zero on any finding, infos included, and every
  public member needs a doc comment.
