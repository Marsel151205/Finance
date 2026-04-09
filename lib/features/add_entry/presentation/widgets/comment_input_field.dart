import 'package:finance_tracker/core/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/dimens.dart';

class CommentInputField extends StatefulWidget {
  const CommentInputField({super.key, required this.onChangeComment});

  final ValueChanged<String> onChangeComment;

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
        widget.onChangeComment(_commentTextFieldController.text);
      },
      onTapOutside: (value) {
        widget.onChangeComment(_commentTextFieldController.text);
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Добавить описание...',
        hintStyle: TextStyle(
          color: textColorSecondary,
          fontSize: textSize14,
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
