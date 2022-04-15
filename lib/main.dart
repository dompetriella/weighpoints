import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'landing.dart';
import 'account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final _router = GoRouter(
      routes: [
        GoRoute(
          name: 'landing',
          path: '/',
          builder: (context, state) => const LandingPage(title: 'WeighPoints Home')
        ),

        GoRoute(
          name: 'account',
          path: '/account',
          builder: (context, state) => const Account()
        ),
      ]
      );

    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'WeighPoints',
      theme: ThemeData.dark(),
    );
  }
}