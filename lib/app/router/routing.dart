import 'package:finance_tracker/app/di/injection.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/add_entry_bloc.dart';
import 'package:finance_tracker/features/add_entry/presentation/pages/add_entry_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (_) => serviceLocator<AddEntryBloc>(),
        child: const AddEntryPage(),
      ),
    ),
  ],
);
