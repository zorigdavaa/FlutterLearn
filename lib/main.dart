import 'package:flutter/material.dart';
import 'package:flutter_app/views/Providers/notifiers.dart';
import 'package:flutter_app/views/widget_tree.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: useDarkModeNotifier,
      builder: (context, useDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: useDarkMode ? Brightness.dark : Brightness.light,
            ),
          ),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(stream: stream, builder: builder)

    return WidgetTree();
  }
}
