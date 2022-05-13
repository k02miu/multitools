import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ErrorText {
  final text = useState('');
  void clear() {
    text.value = '';
  }

  void setErrorText(String error) {
    text.value = error;
  }

  String get getErrorText {
    return text.value;
  }

  ValueNotifier<String> get getState {
    return text;
  }
}
