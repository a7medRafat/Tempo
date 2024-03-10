import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget widget;
  final Color color;

  const AppButton({super.key, required this.widget, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
         color: color
        ),
        child: widget);
  }
}
