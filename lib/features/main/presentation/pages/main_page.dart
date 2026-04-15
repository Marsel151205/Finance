import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/utils/loading_overlay.dart';
import 'package:finance_tracker/core/utils/message_snack_bar.dart';
import 'package:finance_tracker/core/widgets/custom_tab_bar.dart';
import 'package:finance_tracker/features/main/presentation/bloc/overview/overview_bloc.dart';
import 'package:finance_tracker/features/main/presentation/bloc/overview/overview_state.dart';
import 'package:finance_tracker/features/main/presentation/pages/expense_list_screen.dart';
import 'package:finance_tracker/features/main/presentation/pages/income_list_screen.dart';
import 'package:finance_tracker/features/main/presentation/widgets/total_income_and_expense_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection.dart';
import '../../../../core/themes/dimens.dart';
import '../bloc/expense/expense_list_bloc.dart';
import '../bloc/income/income_list_bloc.dart';

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
    return BlocConsumer<OverviewBloc, OverviewState>(
      builder: (context, state) {
        if (state is SuccessOverviewState) {
          LoadingOverlay.hide();
          return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: backgroundColor,
            body: Padding(
              padding: EdgeInsets.all(padding12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Мой Баланс',
                    style: TextStyle(
                      color: textColorSecondary,
                      fontSize: textSize14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '${state.model.sum.toString()} сом',
                    style: TextStyle(
                      color: textColorPrimary,
                      fontSize: textSize24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: height12),
                  Row(
                    children: [
                      Expanded(
                        child: TotalIncomeAndExpenseWidget(
                          isExpense: false,
                          widgetBackgroundColor: incomeWidgetBackground,
                          textColor: incomeWidgetTextColor,
                          title: 'Доходы',
                          sum: state.totalIncome ?? 0,
                        ),
                      ),
                      SizedBox(width: width12),
                      Expanded(
                        child: TotalIncomeAndExpenseWidget(
                          isExpense: true,
                          widgetBackgroundColor: expenseWidgetBackground,
                          textColor: expenseWidgetTextColor,
                          title: 'Расходы',
                          sum: state.totalExpense ?? 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height12),
                  AnimatedBuilder(
                    animation: _tabController.animation!,
                    builder: (context, child) {
                      return CustomTabBar(
                        selectedIndex: _tabController.animation!.value,
                        onTap: (index) => _tabController.animateTo(index),
                      );
                    },
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        BlocProvider(
                          create: (context) =>
                              serviceLocator<ExpenseListBloc>(),
                          child: ExpenseListScreen(),
                        ),
                        BlocProvider(
                          create: (context) => serviceLocator<IncomeListBloc>(),
                          child: IncomeListScreen(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox();
      },
      listener: (context, state) {
        if (state is LoadingOverviewState) LoadingOverlay.show(context);
        if (state is ErrorOverviewState) {
          LoadingOverlay.hide();
          showMessageSnackBar(
            context,
            title: state.errorMessage,
            status: false,
          );
        }
      },
    );
  }
}
