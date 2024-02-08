import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopDealsGrid extends StatelessWidget {
  const TopDealsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.80,
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
                    width: MediaQuery.of(context).size.width * 0.20,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.yellow,),
                        const Text(
                          'Reating' , style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )),
              Container(
                height: 100,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Product Name"),
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
