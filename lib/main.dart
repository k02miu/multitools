import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multitools/base64/views/base64_screen.dart';
import 'package:multitools/constants/colors.dart';
import 'package:multitools/json/views/json_screen.dart';
import 'package:multitools/markdown/views/markdown_screen.dart';
import 'package:multitools/top/views/body.dart';
import 'package:multitools/unicode/views/unicode_screen.dart';
import 'package:multitools/url/views/url_screen.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routeObserver = RouteObserver<PageRoute<dynamic>>();
    return MaterialApp(
      title: 'MultipleDevTools',
      theme: ThemeData(primaryColor: baseColor),
      navigatorObservers: [
        routeObserver,
      ],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('ja', 'JP'),
        Locale('en', 'US'),
      ],
      home: const App(title: 'Multiple Dev tools'),
      routes: {
        Base64Screen.routeName: (_) => Base64Screen(routeObserver),
        UrlScreen.routeName: (_) => UrlScreen(routeObserver),
        JsonScreen.routeName: (_) => JsonScreen(routeObserver),
        MarkdownScreen.routeName: (_) => MarkdownScreen(routeObserver),
        UnicodeScreen.routeName: (_) => UnicodeScreen(routeObserver),
      },
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: objectColor,
        title: Text(title),
      ),
      body: const Center(
        child: Body(),
      ),
    );
  }
}
