import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view/categorys/widget/list_view_product_card.dart';
import '../../../controler/data_mangment/get_data.dart';
import '../../../model/product_model.dart';
import '../data/data_from_firebase.dart';
import '../widget/detail_body.dart';

class GpuCat extends StatelessWidget {
  const GpuCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = CollectionsData().gpuCollection;

    return Scaffold(
      appBar: AppBar(title: Text("headphones")),
      body: BlocProvider<ProductCubit>(
          create: (BuildContext context) {
            final cubit = ProductCubit();
            cubit.getProductsByCollection(['Gpu']); // pass a list of collection names
            return cubit;
          },
          child: DetailBody()
      ),
    );
  }
}