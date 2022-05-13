import 'package:flutter/material.dart';

class CustomRouteAware extends RouteAware {
  CustomRouteAware({
    this.onDidPop,
  });

  final VoidCallback? onDidPop;

  @override
  void didPop() {
    super.didPop();
    if (onDidPop != null) {
      onDidPop!();
    }
  }
}
