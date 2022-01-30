import 'package:flutter/material.dart';

class BackgroundIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Alignment alignment;

  const BackgroundIcon({
    Key? key,
    required this.icon,
    required this.color,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            icon,
            color: color,
            size: 35,
          ),
        ),
      ),
    );
  }
}
