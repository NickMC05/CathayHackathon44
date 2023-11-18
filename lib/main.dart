import 'package:cathay/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
      localizationsDelegates: const [
        // ... other localization delegates you might be using
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
        // ... other locales your app supports
      ],
    );
  }
}
