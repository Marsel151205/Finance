import 'package:finance_tracker/core/utils/loading_overlay.dart';
import 'package:finance_tracker/core/utils/message_snack_bar.dart';
import 'package:finance_tracker/features/main/presentation/widgets/movement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/expense/expense_list_bloc.dart';
import '../bloc/expense/expense_list_state.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpenseListBloc, ExpenseListState>(
      builder: (context, state) {
        if (state is SuccessExpenseListState) {
          LoadingOverlay.hide();
          final expenseList = state.model;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: expenseList.length,
                  itemBuilder: (context, index) {
                    final expenseItem = expenseList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Movement(model: expenseItem),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return SizedBox();
      },
      listener: (context, state) {
        if (state is LoadingExpenseListState) LoadingOverlay.show(context);
        if (state is ErrorExpenseListState) {
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
