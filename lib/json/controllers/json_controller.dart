import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multitools/utils/error_text.dart';

class JsonController {
  final inputTextField = useTextEditingController();
  final outputTextField = useTextEditingController();
  final errorText = ErrorText();

  static JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  static JsonDecoder decoder = const JsonDecoder();

  VoidCallback get pasteText {
    return () async {
      final clip = await Clipboard.getData('text/plain');
      if (clip != null && clip.text != null) {
        inputTextField.text = clip.text!;
      }
    };
  }

  VoidCallback get copyText {
    return () => Clipboard.setData(ClipboardData(text: outputTextField.text));
  }

  VoidCallback get execFormat {
    return () {
      errorText.clear();
      try {
        outputTextField.text =
            encoder.convert(decoder.convert(inputTextField.text));
      } on Exception catch (e) {
        errorText.setErrorText(e.toString());
      }
    };
  }
}
