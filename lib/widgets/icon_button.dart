import 'package:flutter/material.dart';
class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {super.key, this.onPressed, required this.icon, this.iconSize, this.color});
  final void Function()? onPressed;
  final Widget icon;
  final double? iconSize;
  final Color ?color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconSize,
      onPressed: onPressed,
      icon: icon,
      color: color,
    );
  }
}
