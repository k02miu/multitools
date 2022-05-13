import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:multitools/constants/styles.dart';
import 'package:multitools/markdown/controllers/markdown_controller.dart';
import 'package:multitools/constants/colors.dart';
import 'package:multitools/utils/route_custom_notifier.dart';

class MarkdownScreen extends HookConsumerWidget {
  const MarkdownScreen(
    this.routeObserver, {
    Key? key,
  }) : super(key: key);

  final RouteObserver<PageRoute<dynamic>> routeObserver;

  static const routeName = '/markdownscreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ModalRoute.of(context)! as PageRoute;
    final controller = MarkdownController();

    useEffect(() {
      final routeAware = CustomRouteAware();
      routeObserver.subscribe(routeAware, route);
      return () => routeObserver.unsubscribe(routeAware);
    }, [route, routeObserver]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: objectColor,
        title: const Text('Markdown Formatter'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: backgroundBoxDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                'Markdown Formatter',
                style: topLevelText,
              ),
              const SizedBox(height: 24),
              Text(
                'Input Text',
                style: topLevelText,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 24),
                  Flexible(
                    child: multilineTextField(
                      controller: controller.inputTextField,
                      stackedIconData: LineIcons.paste,
                      stackedIconOnTap: controller.pasteText,
                      onChangeNotifier: controller.outputTextState,
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Output Text',
                style: topLevelText,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: baseColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: MarkdownBody(
                                  data: controller.outputTextState.value,
                                  extensionSet: md.ExtensionSet(
                                    md.ExtensionSet.gitHubFlavored
                                        .blockSyntaxes,
                                    [
                                      md.EmojiSyntax(),
                                      ...md.ExtensionSet.gitHubFlavored
                                          .inlineSyntaxes
                                    ],
                                  ),
                                  shrinkWrap: true,
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                controller.errorText.getErrorText,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
