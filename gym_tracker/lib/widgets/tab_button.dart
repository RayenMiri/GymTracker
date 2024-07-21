import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final bool isActive;
  final VoidCallback onTap;

  const TabButton({
    Key? key,
    required this.icon,
    required this.selectIcon,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            isActive ? selectIcon : icon,
            width: 24,
            height: 24,
          ),
        ],
      ),
    );
  }
}
