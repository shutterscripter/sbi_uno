import 'package:flutter/material.dart';
import 'package:sbi_uno/consts/colors.dart';

class TransactionTile extends StatefulWidget {
  final String title;
  final String amount;
  final String date;
  final IconData icon;
  const TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
  });

  @override
  State<TransactionTile> createState() => _TransactionTileState();
}

class _TransactionTileState extends State<TransactionTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(widget.title),
      subtitle: Text(widget.amount),
      trailing: Text(widget.date),
    );
  }
}
