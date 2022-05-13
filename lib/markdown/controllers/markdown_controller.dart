import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multitools/utils/error_text.dart';

class MarkdownController {
  final inputTextField = useTextEditingController();
  final errorText = ErrorText();
  final outputTextState = useState('');

  VoidCallback get pasteText {
    return () async {
      final clip = await Clipboard.getData('text/plain');
      if (clip != null && clip.text != null) {
        inputTextField.text = clip.text!;
      }
    };
  }
}
