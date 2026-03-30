import 'package:finance_tracker/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/dimens.dart';
import '../bloc/expense/add_expense_bloc.dart';

class CommentInputField extends StatefulWidget {
  const CommentInputField({super.key});

  @override
  State<StatefulWidget> createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  final TextEditingController _commentTextFieldController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _commentTextFieldController,
      keyboardType: TextInputType.text,
      onSubmitted: (_) {
        context.read<AddExpenseBloc>().setComment(
          _commentTextFieldController.text,
        );
      },
      onTapOutside: (value) {
        FocusScope.of(context).unfocus();
        context.read<AddExpenseBloc>().setComment(
          _commentTextFieldController.text,
        );
      },
      decoration: InputDecoration(
        hintText: 'Добавить описание...',
        hintStyle: TextStyle(
          color: secondaryTextColor,
          fontSize: textSize14,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
