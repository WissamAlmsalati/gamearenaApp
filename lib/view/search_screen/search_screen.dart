import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/shared_widget/coustom_text_filled.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: CustomTextFilled(
              hintText: "Search",
            ),
          ),
        ]),
      ),
    );
  }
}
