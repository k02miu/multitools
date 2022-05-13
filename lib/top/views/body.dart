import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:multitools/base64/views/base64_screen.dart';
import 'package:multitools/constants/colors.dart';
import 'package:multitools/constants/styles.dart';
import 'package:multitools/json/views/json_screen.dart';
import 'package:multitools/markdown/views/markdown_screen.dart';
import 'package:multitools/top/models/tool_item.dart';
import 'package:multitools/unicode/views/unicode_screen.dart';
import 'package:multitools/url/views/url_screen.dart';

class Body extends HookConsumerWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  static const objectWidth = 180.0;
  static const objectHeight = 360.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: backgroundBoxDecoration,
      child: GridView.extent(
        maxCrossAxisExtent: objectWidth,
        crossAxisSpacing: 4,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
        scrollDirection: Axis.vertical,
        primary: false,
        padding: const EdgeInsets.all(32),
        children: children(context),
      ),
    );
  }

  InkWell iconContainer(ToolItem toolItem) {
    return InkWell(
      onTap: toolItem.onTap,
      child: Container(
        alignment: Alignment.center,
        height: objectHeight,
        width: objectWidth,
        child: Center(
          child: Row(
            children: [
              const SizedBox(
                width: 24,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: objectColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      iconBlock(toolItem.icon),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 16),
                            Flexible(
                              child: Text(
                                toolItem.title,
                                style: _titleTextStyle,
                              ),
                            ),
                            const SizedBox(width: 16),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              Container(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> children(BuildContext context) {
    return [
      iconContainer(
        ToolItem(
          icon: LineIcons.hashtag,
          title: 'Base64\nEncode/Decode',
          description: 'Base64 Encode/Decodeが行えます',
          onTap: () async => {
            await Navigator.pushNamed(context, Base64Screen.routeName),
          },
        ),
      ),
      iconContainer(
        ToolItem(
          icon: LineIcons.code,
          title: 'Json Formatter',
          description: 'JSONのフォーマットを行えます',
          onTap: () => {
            Navigator.pushNamed(context, JsonScreen.routeName),
          },
        ),
      ),
      iconContainer(
        ToolItem(
          icon: LineIcons.percentage,
          title: 'URL\nEncode/Decode',
          description: 'URL Encode/Decodeが行えます',
          onTap: () => {
            Navigator.pushNamed(context, UrlScreen.routeName),
          },
        ),
      ),
      iconContainer(
        ToolItem(
          icon: LineIcons.markdown,
          title: 'Markdown Editor',
          description: 'MarkdownのFormatが行えます',
          onTap: () => {
            Navigator.pushNamed(context, MarkdownScreen.routeName),
          },
        ),
      ),
      iconContainer(
        ToolItem(
          icon: LineIcons.codeFile,
          title: 'Unicode Converter',
          description: 'Unicodeの変換が行えます',
          onTap: () => {
            Navigator.pushNamed(context, UnicodeScreen.routeName),
          },
        ),
      ),
    ];
  }

  Widget iconBlock(IconData _icon) {
    return Center(
      child: Container(
        height: 80,
        width: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: baseColor,
        ),
        child: Icon(
          _icon,
          color: Colors.white,
          size: 52,
        ),
      ),
    );
  }

  TextStyle get _titleTextStyle {
    return const TextStyle(
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    );
  }

  void onTapBase64Encode(BuildContext context) {
    Navigator.pushNamed(context, Base64Screen.routeName);
  }
}
