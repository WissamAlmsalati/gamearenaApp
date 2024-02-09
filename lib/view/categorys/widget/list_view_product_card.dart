import 'package:flutter/material.dart';
import 'package:store/view/categorys/widget/product_card.dart';

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) =>const CardWidget());
  }
}
