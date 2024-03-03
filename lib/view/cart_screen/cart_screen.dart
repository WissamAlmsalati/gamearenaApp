import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view/cart_screen/widget/cart_items.dart';
import '../../cart_list.dart';
import '../../controler/cart_cubit/cart_cubit.dart';
import 'methodes/send_mail.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String userId = FirebaseAuth.instance.currentUser!.uid;

    final userData=FirebaseAuth.instance.currentUser;

    final String userEmail = userData?.email ?? 'No Name';

    return BlocProvider(
      create: (BuildContext context) {
        return CartCubit();
      },
      child: Scaffold(
          body: Column(
            children: [
              BlocBuilder<CartCubit,bool>(
                builder: (BuildContext context, state) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: CartList.cart.length,
                      itemBuilder: (context, index) {
                        return CartListItems(
                          productName: CartList.cart[index].productName,
                          productDescription: CartList.cart[index].productDescription,
                          productPrice: CartList.cart[index].productPrice,
                          productImage: CartList.cart[index].productImage,
                        );
                      },
                    ),
                  );
                },
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Row(
                  children: [
                    Center(
                      child:BlocBuilder<CartCubit,bool>(
                        builder: (BuildContext context, bool state) =>
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: CupertinoButton(
                                color: Colors.white,
                                  child: Text("Order",style: TextStyle(color: Colors.black),), onPressed: ()async{
                                context.read<CartCubit>().clearCart();

                                await EmailSender.sendOrderEmail(userEmail, CartList.cart );

                              }),
                            )

                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: BlocBuilder<CartCubit,bool>(
                          builder: (BuildContext context, state) {
                            String total = CartList.cart.fold(
                                "0",
                                (previousValue, element) =>
                                    (int.parse(previousValue) + int.parse(element.productPrice))
                                        .toString());

                            return Text(
                              total.toString(),
                              style: const TextStyle(fontSize: 20),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}