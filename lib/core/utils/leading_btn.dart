import 'package:flutter/material.dart';

class LeadingIcon extends StatelessWidget {
  final fun;
  final IconData icon;

  const LeadingIcon({super.key, required this.icon, required this.fun});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: fun,
        icon: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white38, width: 0.7)),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  icon,
                  size: 15,
                  color: Colors.white,
                ))));
  }
}
