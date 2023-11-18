import 'package:cathay/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // await dotenv.load(fileName: "assets/.env");

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return CupertinoApp(
      title: 'My App',
      initialRoute: '/',
      routes: routes,
      theme: const CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
    );
  }
}
