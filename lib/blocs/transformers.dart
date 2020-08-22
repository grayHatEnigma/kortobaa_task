import 'dart:async';
import '../constants.dart';

class Transformers {
  // Validations
  final emailValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains('@')) {
      sink.add(email);
    } else {
      sink.addError(kInvalidEmail);
    }
  });

  final nameValidator =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.length >= 4) {
      sink.add(name);
    } else {
      sink.addError(kInvalidName);
    }
  });
}
