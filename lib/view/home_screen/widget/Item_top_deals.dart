import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/model/product_model.dart';

class TopDealsGrid extends StatelessWidget {
  const TopDealsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.black,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.70,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisExtent: 200,
          mainAxisSpacing: 2,
        ),
        itemCount: 6,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.029,
                    width: MediaQuery.of(context).size.width * 0.30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                         Text(
                          'Reating',
                          style: TextStyle(color: Colors.white,
                            fontSize: screenWidth * 0.03, // Adjust the value as needed

                          ),
                        ),
                      ],
                    ),
                  )),
              Container(
                height: MediaQuery.of(context).size.height*0.09,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Name",
                    ),
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
      ),
    );
  }
}
