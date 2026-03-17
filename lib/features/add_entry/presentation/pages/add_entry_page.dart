import 'package:finance_tracker/app/di/injection.dart';
import 'package:finance_tracker/core/widgets/standar_app_bar.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/expense/expense_bloc.dart';
import 'package:finance_tracker/features/add_entry/presentation/pages/expense_screen.dart';
import 'package:finance_tracker/features/add_entry/presentation/pages/income_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/dimens.dart';

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
      appBar: StandardAppBar(title: 'Новая запись'),
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
              children: [
                BlocProvider(
                  create: (context) => serviceLocator<ExpenseBloc>(),
                  child: ExpenseScreen(),
                ),
                IncomeScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
