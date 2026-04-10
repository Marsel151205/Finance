import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/themes/dimens.dart';
import 'package:finance_tracker/core/utils/loading_overlay.dart';
import 'package:finance_tracker/core/utils/message_snack_bar.dart';
import 'package:finance_tracker/features/create_balance/presentation/bloc/create_balance_event.dart';
import 'package:finance_tracker/features/create_balance/presentation/bloc/create_balance_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../shared/income_and_expense/presentation/widgets/amount_input_field.dart';
import '../bloc/create_balance_bloc.dart';

class CreateBalancePage extends StatefulWidget {
  const CreateBalancePage({super.key});

  @override
  State<StatefulWidget> createState() => _CreateBalanceState();
}

class _CreateBalanceState extends State<CreateBalancePage> {
  int? sum;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateBalanceBloc, CreateBalanceState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: primary,
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.only(
              left: paddingLeft10,
              right: paddingRight10,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Добро\nпожаловать!',
                        style: TextStyle(
                          color: textColorOnWidget,
                          fontSize: textSize30,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: height12),
                      Text(
                        'Давайте настроим ваш кошелек. Введите сумму, которая у вас сейчас есть, чтобы начать учет правильно',
                        style: TextStyle(
                          color: textColorSecondary,
                          fontSize: textSize16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: height20),
                      Align(
                        alignment: Alignment.center,
                        child: Card.outlined(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(circular12),
                            side: BorderSide(width: 1, color: borderInput),
                          ),
                          color: primaryLight,
                          child: Padding(
                            padding: EdgeInsets.all(padding12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Стартовый баланс'.toUpperCase(),
                                  style: TextStyle(
                                    color: hintColorPrimary,
                                    fontSize: textSize14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                AmountInputField(
                                  onInputAmount: (value) {
                                    sum = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CreateBalanceBloc>().add(
                      CreateNewBalanceEvent(sum),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: surfaceVariant,
                    minimumSize: const Size(double.infinity, 0),
                    padding: EdgeInsets.only(
                      top: paddingTop16,
                      bottom: paddingBottom16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(circular12),
                    ),
                  ),
                  child: Text(
                    'Создать Баланс',
                    style: TextStyle(
                      color: primary,
                      fontSize: textSize18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: height24),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoadingCreateBalanceState) LoadingOverlay.show(context);
        if (state is ErrorCreateBalanceState) {
          LoadingOverlay.hide();
          showMessageSnackBar(
            context,
            title: state.errorMessage,
            status: false,
          );
        }
        if (state is SuccessCreateBalanceState) {
          LoadingOverlay.hide();
          context.go('/overview');
        }
      },
    );
  }
}
