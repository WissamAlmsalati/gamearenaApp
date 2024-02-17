import 'package:firebase_auth/firebase_auth.dart';
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
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child:BlocBuilder<CartCubit,bool>(
                          builder: (BuildContext context, bool state) =>
                              ElevatedButton(
                                onPressed: () async{
                                  TextEditingController otpController = TextEditingController();
                                  showDialog(context: context, builder: (context) => AlertDialog(
                                    title: const Text("Order"),
                                    content: const Text("Your Order has been sent"),
                                    actions: [
                                     Column(
                                    children: [
                                    TextFormField(
                                    controller: otpController,
                                    keyboardType: TextInputType.number,
                                    maxLength: 4,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter OTP',
                                    ),
                                  ),
                                  ElevatedButton(
  onPressed: () async {
    // Generate the OTP
    String generatedOTP = await EmailSender.generateOTP();

    // Show the dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Order"),
        content: const Text("Your Order has been sent"),
        actions: [
          Column(
            children: [
              TextFormField(
                controller: otpController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter OTP',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (otpController.text == generatedOTP) {
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid OTP'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ],
      ),
    );

    // Send the order email with the generated OTP
    await EmailSender.sendOrderEmail(userEmail, CartList.cart, generatedOTP);
  },
  child: const Text('Order'),
),
                                    ],
                                     )
                                    ],
                                  ));
                                  try{
                                    EmailSender.sendOrderEmail(userEmail , CartList.cart, otpController.text);
                                    context.read<CartCubit>().clearCart();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Order Sent'),
                                      ),
                                    );
                                  }catch(e){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Error:'),
                                      ),
                                    );
                                  }
                                },
                                child:  Text(userEmail),
                              )
                        ),
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