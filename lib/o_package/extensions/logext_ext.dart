import 'dart:developer' as devtools show log;

extension LogExt on Object {
  void log() => devtools.log(toString());
}
