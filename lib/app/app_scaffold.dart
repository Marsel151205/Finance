import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/themes/colors.dart';
import '../core/themes/dimens.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    super.key,
    required this.child,
    required this.screenTitle,
  });

  final String screenTitle;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.screenTitle,
          style: TextStyle(
            color: textColorPrimary,
            fontSize: textSize20,
            fontWeight: FontWeight.w900,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: onTap,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Main'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/main')) return 0;
    if (location.startsWith('/add_entry')) return 1;

    return 0;
  }

  void onTap(int value) {
    switch (value) {
      case 0:
        context.go('/main');
      case 1:
        context.go('/add_entry');
      default:
        context.go('/main');
    }
  }
}
