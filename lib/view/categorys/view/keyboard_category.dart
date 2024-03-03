import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/controler/data_mangment/get_data.dart';
import 'package:store/model/product_model.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';

import '../data/data_from_firebase.dart';
import '../widget/detail_body.dart';

class KeyBoardCat extends StatelessWidget {
  const KeyBoardCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("keyboards")),
        body: BlocProvider(
          create: (BuildContext context) {
            final cubit = ProductCubit();
            cubit.getProductsByCollection(["keyboards"]);
            return cubit;
          },
          child: DetailBody()
        ));
  }
}
