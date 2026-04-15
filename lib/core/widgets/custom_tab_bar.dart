import 'package:finance_tracker/core/themes/colors.dart';
import 'package:finance_tracker/core/themes/dimens.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final double selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding4),
      decoration: BoxDecoration(
        color: surfaceVariant,
        borderRadius: BorderRadius.circular(circular10),
      ),
      child: Row(
        children: [
          _buildTab(0, 'Расходы'),
          SizedBox(width: width4),
          _buildTab(1, 'Доходы'),
        ],
      ),
    );
  }

  Widget _buildTab(int index, String title) {
    final isSelected = (1.0 - (selectedIndex - index).abs()).clamp(0.0, 1.0);
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Color.lerp(Colors.transparent, surface, isSelected),
            borderRadius: BorderRadius.circular(circular10),
            boxShadow: isSelected > 0.1
                ? [
                    BoxShadow(
                      color: surfaceVariant,
                      blurRadius: 2 * isSelected,
                    ),
                  ]
                : [],
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.lerp(
                FontWeight.normal,
                FontWeight.bold,
                isSelected,
              ),
              color: Color.lerp(
                unselectedTextColor,
                selectedTextColor,
                isSelected,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
