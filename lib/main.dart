import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/util/router/go_routes.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
class MyApp extends StatefulWidget {
  /// Constructs the [MyApp] widget.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GoRouter router = GoRouterManager().router;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Pokemon App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
