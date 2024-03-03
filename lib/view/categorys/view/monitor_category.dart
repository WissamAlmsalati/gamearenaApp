import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/model/product_model.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';

import '../../../controler/data_mangment/get_data.dart';
import '../widget/detail_body.dart';

class MonitorCat extends StatelessWidget {
  const MonitorCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Monitor")),
      body: BlocProvider<ProductCubit>(
        create: (BuildContext context) {
          final cubit = ProductCubit();
          cubit.getProductsByCollection(['screens']); // pass a list of collection names
          return cubit;
        },
        child: DetailBody()
      ),
    );
  }
}