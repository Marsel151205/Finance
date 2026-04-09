import 'package:finance_tracker/app/app_scaffold.dart';
import 'package:finance_tracker/features/add_entry/presentation/pages/add_entry_page.dart';
import 'package:finance_tracker/features/create_balance/presentation/bloc/create_balance_bloc.dart';
import 'package:finance_tracker/features/create_balance/presentation/pages/create_balance_page.dart';
import 'package:finance_tracker/features/main/presentation/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/main/presentation/bloc/overview/overview_bloc.dart';
import '../di/injection.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/overview',
  redirect: (context, state) async {
    final preferences = await SharedPreferences.getInstance();
    final isFirstLaunch = preferences.getBool('isFirstLaunch') ?? false;

    Future.delayed(Duration(milliseconds: 500));
    if (state.matchedLocation == '/splash') {
      return isFirstLaunch ? '/overview' : '/create-balance';
    }
    return null;
  },
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        final screenTitles = {
          '/overview': 'Главная',
          '/add_entry': 'Новая запись',
        };
        return AppScaffold(
          screenTitle: screenTitles[state.uri.toString()] ?? 'йцу',
          child: child,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/overview',
          builder: (context, state) => BlocProvider(
            create: (context) => serviceLocator<OverviewBloc>(),
            child: MainPage(),
          ),
        ),
        GoRoute(
          path: '/add_entry',
          builder: (context, state) => AddEntryPage(),
        ),
      ],
    ),
    GoRoute(
      path: '/create-balance',
      builder: (context, state) => BlocProvider(
        create: (context) => serviceLocator<CreateBalanceBloc>(),
        child: CreateBalancePage(),
      ),
    ),
  ],
);
