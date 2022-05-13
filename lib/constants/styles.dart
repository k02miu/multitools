import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:multitools/constants/colors.dart';

TextStyle get topLevelText {
  return const TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.w700,
  );
}

Widget multilineTextField({
  required TextEditingController controller,
  required VoidCallback stackedIconOnTap,
  required IconData stackedIconData,
  bool isEnabled = true,
  ValueNotifier<String>? onChangeNotifier,
}) {
  InputDecoration decoration(VoidCallback clearText) {
    return InputDecoration(
      filled: true,
      fillColor: baseColor,
      suffixIcon: InkWell(
          child: const Icon(
            LineIcons.times,
            color: Colors.white,
          ),
          onTap: clearText),
      suffixIconColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide.none,
      ),
    );
  }

  return Stack(
    children: [
      TextFormField(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        decoration: decoration(() => controller.text = ''),
        maxLines: null,
        minLines: 7,
        cursorColor: objectColor,
        controller: controller,
        enabled: isEnabled,
        onChanged: (text) => onChangeNotifier?.value = text,
      ),
      Positioned(
        right: 8,
        top: 8,
        child: InkWell(
          child: Icon(
            stackedIconData,
            color: Colors.white,
          ),
          onTap: stackedIconOnTap,
        ),
      )
    ],
  );
}

const backgroundBoxDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: gradientBackgroundColors,
    stops: [0.0, 0.7, 1.0],
  ),
);
