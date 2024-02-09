import 'package:flutter/material.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';

class GpuCat extends StatelessWidget {
  const GpuCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GpuCat")),
    body:const Expanded(child: CardListView()),
    );
  }
}
