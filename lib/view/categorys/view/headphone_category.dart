import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controler/data_mangment/get_data.dart';
import '../widget/detail_body.dart';

class HeadPhoneCat extends StatelessWidget {
  const HeadPhoneCat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("headphones")),
      body: BlocProvider<ProductCubit>(
          create: (BuildContext context) {
            final cubit = ProductCubit();
            cubit.getProductsByCollection(['headphones']); // pass a list of collection names
            return cubit;
          },
          child: DetailBody()
      ),
    );
  }
}