import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/utils/loading_overlay.dart';
import 'package:finance_tracker/core/utils/message_snack_bar.dart';
import 'package:finance_tracker/features/main/presentation/bloc/income/income_list_state.dart';
import 'package:finance_tracker/features/main/presentation/widgets/movement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/dimens.dart';
import '../bloc/income/income_list_bloc.dart';

class IncomeListScreen extends StatelessWidget {
  const IncomeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IncomeListBloc, IncomeListState>(
      builder: (context, state) {
        if (state is SuccessIncomeListState) {
          LoadingOverlay.hide();
          if (state.incomeList.isEmpty) {
            return Align(
              alignment: Alignment.center,
              child: Text(
                'Операций нет',
                style: TextStyle(
                  color: textColorPrimary,
                  fontSize: textSize18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            );
          } else {
            final incomeList = state.incomeList;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height12),
                      Text(
                        'Недавние операции',
                        style: TextStyle(
                          color: textColorPrimary,
                          fontSize: textSize18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: height12),
                    ],
                  ),
                ),
                SliverList.builder(
                  itemCount: incomeList.length,
                  itemBuilder: (context, index) {
                    final incomeItem = incomeList[index];
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Movement(incomeModel: incomeItem),
                    );
                  },
                ),
              ],
            );
          }
        }
        return SizedBox();
      },
      listener: (context, state) {
        if (state is LoadingIncomeListState) LoadingOverlay.show(context);
        if (state is ErrorIncomeListState) {
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
