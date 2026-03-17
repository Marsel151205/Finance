import 'package:finance_tracker/core/themes/colors.dart';
import 'package:flutter/material.dart';

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
      onTapOutside: (_) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Комментарий',
        hintStyle: TextStyle(color: secondaryTextColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

      ),
    );
  }
}
