import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/features/main/presentation/pages/expense_list_screen.dart';
import 'package:finance_tracker/features/main/presentation/pages/income_list_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/dimens.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          TabBar(
            labelColor: selectedTextColor,
            unselectedLabelColor: unselectedTextColor,
            labelStyle: TextStyle(fontSize: textSize16),
            controller: _tabController,
            tabs: const [
              Tab(text: 'Расходы'),
              Tab(text: 'Доходы'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [ExpenseListScreen(), IncomeListScreen()],
            ),
          ),
        ],
      ),
    );
  }
}
