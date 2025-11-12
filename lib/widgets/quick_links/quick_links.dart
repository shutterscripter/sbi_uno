import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sbi_uno/consts/colors.dart';

class QuickLinks extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;

  const QuickLinks({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: isSelected ? ColorConsts.accentColor : ColorConsts.cardColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            icon,
            size: 26,
            color: isSelected ? Colors.white : ColorConsts.primaryText,
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected
                ? ColorConsts.accentColor
                : ColorConsts.primaryText,
          ),
        ),
      ],
    );
  }
}
