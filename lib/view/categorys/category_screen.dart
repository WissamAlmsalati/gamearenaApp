
import 'package:flutter/cupertino.dart';

class CategoryScreen extends StatelessWidget {
  final int index;
  const CategoryScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    switch(index){
    return Container(
      child: Text('Category Screen'),
    );
  }
}
