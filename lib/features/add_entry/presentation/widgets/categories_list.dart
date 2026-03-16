import 'package:finance_tracker/core/utils/message_snack_bar.dart';
import 'package:finance_tracker/features/add_entry/presentation/bloc/expense/expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.read<ExpenseBloc>().getExpenseCategories();
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1.0,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 4,
          child: InkWell(
            onTap: () {
              showMessageSnackBar(context, title: item.title, status: true);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(item.title)],
            ),
          ),
        );
      },
    );
  }
}
