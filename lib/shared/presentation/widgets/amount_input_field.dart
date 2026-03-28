import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/themes/colors.dart';
import '../../../core/themes/dimens.dart';

class AmountInputField extends StatefulWidget {
  const AmountInputField({super.key});

  @override
  State<StatefulWidget> createState() => _AmountInputFieldState();
}

class _AmountInputFieldState extends State<AmountInputField> {
  final TextEditingController _controller = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: paddingVertical24,
        horizontal: paddingHorizontal24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicWidth(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicWidth(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    onTapOutside: (_) {
                      FocusScope.of(context).unfocus();
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(
                      color: textColorPrimary,
                      fontSize: textSize30,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: TextStyle(color: textColorPrimary),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: paddingLeft6,
                    top: paddingTop10,
                  ),
                  child: Text(
                    '₽',
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: textSize20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height6),
          Container(
            width: width100,
            height: height4,
            decoration: BoxDecoration(
              color: widgetColorPrimary,
              borderRadius: BorderRadius.circular(circular2),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
