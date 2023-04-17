import 'package:flutter/material.dart';

class IconsWidgets extends StatelessWidget {
  const IconsWidgets(
      {required this.iconLogo,
      this.colorOfIcon,
      required this.sizeOfIcon,
      this.onPressed});

  final Icon iconLogo;
  final double sizeOfIcon;
  final Color? colorOfIcon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Icon(
        iconLogo.icon,
        size: sizeOfIcon,
        color: colorOfIcon,
      ),
    );
  }
}
