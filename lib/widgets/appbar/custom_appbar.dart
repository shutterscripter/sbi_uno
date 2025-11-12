import 'package:flutter/material.dart';
import 'package:sbi_uno/consts/colors.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          IconButton(onPressed: () {
            Scaffold.of(context).openDrawer();
          }, icon: Icon(LucideIcons.menu, size: 20)),
          Text(
            'YONO',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: ColorConsts.accentColor,
            ),
          ),
          SizedBox(width: 5),
          Text(
            'SBI',
            style: TextStyle(fontSize: 20, color: ColorConsts.primaryText),
          ),
          Spacer(),
          IconButton(onPressed: () {}, icon: Icon(LucideIcons.headset, size: 20, color: ColorConsts.accentColor,)),
        ],
      ),
    );
  }
}
