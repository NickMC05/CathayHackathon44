

import 'package:cathay/pages/home.dart';
import 'package:cathay/pages/report.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const HomePage(),
  '/report': (BuildContext context) => ReportPage(),
};
