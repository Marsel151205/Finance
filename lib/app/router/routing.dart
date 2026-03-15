import 'package:finance_tracker/features/add_entry/presentation/pages/add_entry_page.dart';
import 'package:go_router/go_router.dart';

final goRouter = GoRouter(
  initialLocation: '/',
  routes: [GoRoute(path: '/', builder: (context, state) => AddEntryPage())],
);
