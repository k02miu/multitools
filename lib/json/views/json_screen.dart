import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:multitools/constants/colors.dart';
import 'package:multitools/constants/styles.dart';
import 'package:multitools/json/controllers/json_controller.dart';
import 'package:multitools/utils/route_custom_notifier.dart';

class JsonScreen extends HookConsumerWidget {
  const JsonScreen(
    this.routeObserver, {
    Key? key,
  }) : super(key: key);

  final RouteObserver<PageRoute<dynamic>> routeObserver;

  static const routeName = '/jsonscreen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ModalRoute.of(context)! as PageRoute;
    final controller = JsonController();

    useEffect(() {
      final routeAware = CustomRouteAware();
      routeObserver.subscribe(routeAware, route);
      return () => routeObserver.unsubscribe(routeAware);
    }, [route, routeObserver]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: objectColor,
        title: const Text('JSON Formatter'),
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
                'JSON Formatter',
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
                    ),
                  ),
                  const SizedBox(width: 24),
                ],
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                child: const Text(
                  'Format',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: baseColor,
                  onPrimary: objectColor,
                ),
                onPressed: controller.execFormat,
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
                  Flexible(
                    child: multilineTextField(
                      controller: controller.outputTextField,
                      stackedIconData: LineIcons.copy,
                      stackedIconOnTap: controller.copyText,
                      isEnabled: false,
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
