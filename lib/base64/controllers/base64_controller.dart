import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multitools/utils/error_text.dart';

class Base64Controller {
  final inputTextField = useTextEditingController();
  final outputTextField = useTextEditingController();
  final errorText = ErrorText();

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

  VoidCallback get execDecode {
    return () {
      errorText.clear();
      try {
        outputTextField.text = utf8.decode(base64Decode(inputTextField.text));
      } on Exception catch (e) {
        errorText.setErrorText(e.toString());
      }
    };
  }

  VoidCallback get execEncode {
    return () {
      errorText.clear();
      try {
        outputTextField.text = base64.encode(utf8.encode(inputTextField.text));
      } on Exception catch (e) {
        errorText.setErrorText(e.toString());
      }
    };
  }
}
