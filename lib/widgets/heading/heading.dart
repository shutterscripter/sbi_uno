import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:sbi_uno/consts/colors.dart';

class Heading extends StatelessWidget {
  final String title;
  final String subtitle;
  final String hintText;
  const Heading({
    super.key,
    required this.title,
    required this.subtitle,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ColorConsts.primaryText,
                ),
              ),
              SizedBox(width: 5),
              Text(
                subtitle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          //Seach bar
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: ColorConsts.cardColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorConsts.secondaryText,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  LucideIcons.search300,
                  size: 16,
                  color: ColorConsts.secondaryText,
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: ColorConsts.secondaryText,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
