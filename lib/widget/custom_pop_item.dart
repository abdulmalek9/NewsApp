import 'package:flutter/material.dart';

class CustomPopItem extends StatelessWidget {
  const CustomPopItem({
    super.key,
    required this.itemName,
    required this.itemIcon,
  });
  final String itemName;
  final IconData itemIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(itemIcon),
        const SizedBox(
          width: 12,
        ),
        Text(itemName),
      ],
    );
  }
}
