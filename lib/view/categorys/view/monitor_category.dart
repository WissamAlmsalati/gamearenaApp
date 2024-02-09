import 'package:flutter/material.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';

class MonitorCat extends StatelessWidget {
  const MonitorCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MonitorCat")),
      body:const Expanded(child: CardListView()),
    );
  }
}
