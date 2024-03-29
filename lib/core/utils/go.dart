import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
  context, MaterialPageRoute(builder: (context) => widget),
);

 navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (Route) => false);