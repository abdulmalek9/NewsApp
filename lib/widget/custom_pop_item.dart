import 'package:flutter/material.dart';

class CustomPopItem extends StatelessWidget {
  const CustomPopItem({
    super.key,
    required this.itemName,
    required this.itemIcon,
    required this.color,
  });
  final String itemName;
  final IconData itemIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          itemIcon,
          color: color,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(itemName),
      ],
    );
  }
}
