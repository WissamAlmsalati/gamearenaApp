import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:store/view/detail_product_screen/detail_screen.dart';
import '../../../controler/data_mangment/get_data.dart';

class TopDealsGrid extends StatelessWidget {
  const TopDealsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (BuildContext context) {
        final cubit = ProductCubit();
        cubit.getProductsByCollection(['AllProducts']);
        return cubit;
      },
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state.status == ProductStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.status == ProductStatus.error) {
            return Center(child: Text(state.message));
          } else {
            if (state.products.isEmpty) {
              return Center(child: Text('No data available'));
            } else {
              return Container(
                height: 1000,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2,
                    mainAxisExtent: 200,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(() => DetailScreen(
                              title: product.productName,
                              image: product.productImage,
                              price: product.productPrice.toString(),
                              description: product.productDescription,
                            )

                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(product.productImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(product.productName),
                                  const Row(
                                    children: [
                                      Text("Price"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Discount"),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}
