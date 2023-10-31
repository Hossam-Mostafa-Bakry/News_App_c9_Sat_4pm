import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String title;
  bool selected;

  TabBarItem({
    super.key,
    required this.title,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      width: 120,
      height: 40,
      decoration: BoxDecoration(
          color: selected ? theme.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: theme.primaryColor, width: 2)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: selected ? Colors.white : theme.primaryColor,
        ),
      ),
    );
  }
}
