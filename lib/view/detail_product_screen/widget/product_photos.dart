import 'package:flutter/material.dart';

class ProductPhotos extends StatelessWidget {
  String? image;
   ProductPhotos({Key? key,required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.22,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: Image.network(image!).image,
                fit: BoxFit.cover,
              ),
            ),
            // child: Image.asset(image)
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
