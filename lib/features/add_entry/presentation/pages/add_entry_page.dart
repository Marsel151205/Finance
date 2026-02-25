import 'package:finance_tracker/core/utils/loading_overlay.dart';
import 'package:finance_tracker/core/utils/message_snack_bar.dart';
import 'package:finance_tracker/core/widgets/standar_app_bar.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/add_entry_event..dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/add_entry_state.dart';
import 'package:finance_tracker/features/add_entry/presentation/pages/expenses_screen.dart';
import 'package:finance_tracker/features/add_entry/presentation/pages/income_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/themes/dimens.dart';
import '../bloc/add_entry_bloc.dart';

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
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        context.read<AddEntryBloc>().add(
          SaveIsExpenseEvent(_tabController.index == 0),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: StandardAppBar(title: 'Новая запись'),
      body: BlocConsumer<AddEntryBloc, AddEntryState>(
        listener: (context, state) {
          if (state is ErrorState) {
            LoadingOverlay.hide();
            showMessageSnackBar(
              context,
              title: state.errorMessage,
              status: false,
            );
          }
          if (state is LoadingState) {
            LoadingOverlay.show(context);
          }
          if (state is SuccessState) {
            LoadingOverlay.hide();
          }
        },
        builder: (context, state) {
            return Column(
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
                    children: [ExpenseScreen(), IncomeScreen()],
                  ),
                ),
              ],
            );
        },
      ),
    );
  }
}
