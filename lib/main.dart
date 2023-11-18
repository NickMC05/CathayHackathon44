import 'package:cathay/routes.dart';
import 'package:flutter/material.dart';
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
    const textTheme = TextTheme(
      headline1: TextStyle(
        fontFamily: 'SegoeUI',
      ),
    );

    final kDarkColorScheme = ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 20, 21, 21),
      brightness: Brightness.dark,
      primaryContainer: Colors.grey[900],
    );

    final kLightColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.blue, // replace with your desired color
      brightness: Brightness.light,
      primaryContainer:
          Colors.white, // set your primary container color for light mode here
    );

    final theme = ThemeData(
      colorScheme: kLightColorScheme,
      // set your color scheme here
      primarySwatch: Colors.blue,
      textTheme: textTheme,
      useMaterial3: true,
      appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
      cardTheme: const CardTheme(
        color: Colors.white,
        shadowColor: Colors.black,
      ),
    );

    final darkTheme = ThemeData.dark().copyWith(
      textTheme: textTheme.apply(bodyColor: Colors.white),
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      iconTheme: const IconThemeData(color: Colors.white),
      appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.transparent,
          backgroundColor: Color.fromARGB(38, 40, 43, 1)),
      cardTheme: CardTheme(
        color: const Color.fromARGB(255, 77, 75, 75),
        shadowColor: Colors.grey[400],
      ),
    );

    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: routes,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
    );
  }
}
