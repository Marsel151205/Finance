import 'package:finance_tracker/app/di/injection.dart';
import 'package:finance_tracker/core/widgets/custom_tab_bar.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/expense/add_expense_bloc.dart';
import 'package:finance_tracker/features/add_entry/presentation/pages/add_expense_screen.dart';
import 'package:finance_tracker/features/add_entry/presentation/pages/add_income_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/dimens.dart';
import '../bloc/income/add_income_bloc.dart';

class AddEntryPage extends StatefulWidget {
  const AddEntryPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddEntryPageState();
}

class _AddEntryPageState extends State<AddEntryPage>
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingHorizontal12),
            child: AnimatedBuilder(
              animation: _tabController.animation!,
              builder: (context, child) {
                return CustomTabBar(
                  selectedIndex: _tabController.animation!.value,
                  onTap: (index) => _tabController.animateTo(index),
                );
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                BlocProvider(
                  create: (context) => serviceLocator<AddExpenseBloc>(),
                  child: ExpenseScreen(),
                ),
                BlocProvider(
                  create: (context) => serviceLocator<AddIncomeBloc>(),
                  child: IncomeScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
