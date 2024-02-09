import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/view/home_screen/widget/Item_top_deals.dart';
import 'package:store/view/home_screen/widget/ads_container.dart';
import 'package:store/view/home_screen/widget/category_listview.dart';
import 'package:store/view/home_screen/widget/coustom_appbar.dart';

import '../../constans.dart';
import '../../shared_widget/coustom_text_filled.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimension appDimension = AppDimension(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const CoustomAppBar(),
                const SizedBox(
                  height: 5,
                ),
                CoustomTextFilled(
                  hintText: "Try Search Here",
                  icon:const Icon(Icons.search),
                ),
                const SizedBox(
                  height: 20,
                ),
                AdsContainer(),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Categories",)),
                CustomListView(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Top Deals",),
                    const Spacer(),
                    TextButton(onPressed: (){}, child: Text("View All"))
                  ],
                ),
                TopDealsGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
