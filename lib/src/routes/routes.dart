import 'package:flutter_template/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      "home": (context) {
        return HomePage();
      }
    };
  }
}