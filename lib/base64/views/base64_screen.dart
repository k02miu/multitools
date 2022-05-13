import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:multitools/base64/controllers/base64_controller.dart';
import 'package:multitools/constants/colors.dart';
import 'package:multitools/constants/styles.dart';
import 'package:multitools/utils/route_custom_notifier.dart';

class Base64Screen extends HookConsumerWidget {
  const Base64Screen(
    this.routeObserver, {
    Key? key,
  }) : super(key: key);

  final RouteObserver<PageRoute<dynamic>> routeObserver;

  static const routeName = '/base64screen';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final route = ModalRoute.of(context)! as PageRoute;
    final controller = Base64Controller();

    useEffect(() {
      final routeAware = CustomRouteAware();
      routeObserver.subscribe(routeAware, route);
      return () => routeObserver.unsubscribe(routeAware);
    }, [route, routeObserver]);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: objectColor,
        title: const Text('base64 Encode/Decode'),
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
                'Base64 Encode/Decode',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    child: const Text(
                      'Encode',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: baseColor,
                      onPrimary: objectColor,
                    ),
                    onPressed: controller.execEncode,
                  ),
                  const SizedBox(width: 24),
                  ElevatedButton(
                    child: const Text(
                      'Decode',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: baseColor,
                      onPrimary: objectColor,
                    ),
                    onPressed: controller.execDecode,
                  )
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
