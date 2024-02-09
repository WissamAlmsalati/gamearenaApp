import 'package:flutter/material.dart';
import 'package:store/view/categorys/view/desk_category.dart';
import 'package:store/view/categorys/view/gpu_category.dart';
import 'package:store/view/categorys/view/headphone_category.dart';
import 'package:store/view/categorys/view/keyboard_category.dart';
import 'package:store/view/categorys/view/monitor_category.dart';
import 'package:store/view/categorys/view/mouse_category.dart';

class MainCatSwich extends StatelessWidget {
  final int index;
  const MainCatSwich({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List <Widget>_CatScreen = [
      MonitorCat(),
      KeyBoardCat(),
      MouseCat(),
      HeadPhoneCat(),
      DeskCat(),
      GpuCat(),
    ];
    return _CatScreen[index];
  }
}