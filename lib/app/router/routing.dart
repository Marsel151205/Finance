import 'package:finance_tracker/app/app_scaffold.dart';
import 'package:finance_tracker/features/add_entry/presentation/pages/add_entry_page.dart';
import 'package:finance_tracker/features/main/presentation/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/main',
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        final screenTitles = {'/main': 'Главная', '/add_entry': 'Новая запись'};
        return AppScaffold(
          screenTitle: screenTitles[state.uri.toString()] ?? 'йцу',
          child: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(path: '/main', builder: (context, state) => MainPage()),
        GoRoute(
          path: '/add_entry',
          builder: (context, state) => AddEntryPage(),
        ),
      ],
    ),
  ],
);
