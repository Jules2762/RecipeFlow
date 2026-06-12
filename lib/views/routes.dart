import 'package:flutter/material.dart';
import 'package:test_flutter/views/pages/home/home_page.dart';
import 'package:test_flutter/views/pages/pointage/pointage_page.dart';
import 'package:test_flutter/views/pages/profile/profile_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/": (context) => HomePage(),
    "/profile": (context) => ProfilePage(),
    "/pointage": (context) => PointagePage(),
  };
}
