import 'package:flutter/material.dart';

class AppDimension {
  final BuildContext context;

  AppDimension(this.context);

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;

}

class CategoryIcons {
}
