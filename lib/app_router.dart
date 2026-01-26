import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final AppRouter _instance = AppRouter._internal();
  factory AppRouter() => _instance;
  AppRouter._internal();

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: _routes,
    redirect: _redirectLogic,
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.matchedLocation}')),
    ),
  );

  static final List<GoRoute> _routes = [
    // GoRoute(
    //   path: '/login',
    //   name: 'login',
    //   builder: (context, state) => const LoginPage(),
    // ),
    // GoRoute(
    //   path: '/home',
    //   name: 'home',
    //   builder: (context, state) => const HomePage(),
    // ),
  ];

  static String? _redirectLogic(BuildContext context, GoRouterState state) {
    final isLoggedIn = false;
    final currentPath = state.uri.path;

    if (!isLoggedIn && currentPath != '/login') return '/login';

    return null;
  }
}
