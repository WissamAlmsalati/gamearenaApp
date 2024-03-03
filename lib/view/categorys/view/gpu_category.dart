import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controler/data_mangment/get_data.dart';
import '../widget/detail_body.dart';

class GpuCat extends StatelessWidget {
  const GpuCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:const Text("headphones")),
      body: BlocProvider<ProductCubit>(
          create: (BuildContext context) {
            final cubit = ProductCubit();
            cubit.getProductsByCollection(['Gpu']); // pass a list of collection names
            return cubit;
          },
          child:const DetailBody()
      ),
    );
  }
}