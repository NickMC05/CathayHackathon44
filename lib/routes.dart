

import 'package:cathay/pages/home.dart';
import 'package:cathay/pages/report.dart';
import 'package:cathay/pages/trip_details.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const HomePage(),
  '/report': (BuildContext context) => ReportPage(),
  '/trip_details': (BuildContext context) => const TripDetailsPage(),
};
