import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multitools/utils/error_text.dart';

class UnicodeController {
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
        final Pattern unicodePattern = RegExp(r'\\u([0-9A-Fa-f]{4})');
        final String? newStr = inputTextField.text
            .replaceAllMapped(unicodePattern, (Match unicodeMatch) {
          final int hexCode = int.parse(unicodeMatch.group(1)!, radix: 16);
          final unicode = String.fromCharCode(hexCode);
          return unicode;
        });
        outputTextField.text = newStr ?? '';
      } on Exception catch (e) {
        errorText.setErrorText(e.toString());
      }
    };
  }
}
