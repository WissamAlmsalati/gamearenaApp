import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controler/data_mangment/get_data.dart';
import 'list_view_product_card.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state.status == ProductStatus.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (state.status == ProductStatus.error) {
          return Center(child: Text(state.message));
        } else {
          if (state.products.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return Expanded(child: CardListView(products: state.products));
          }
        }
      },
    );
  }
}
