import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/view/home_screen/widget/Item_top_deals.dart';
import 'package:store/view/home_screen/widget/ads_container.dart';
import 'package:store/view/home_screen/widget/category_listview.dart';
import 'package:store/view/home_screen/widget/coustom_appbar.dart';

import '../../Constants/constans.dart';
import '../../MyThemeData.dart';
import '../../shared_widget/coustom_text_filled.dart';
import '../search_screen/search_screen.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    AppDimension appDimension = AppDimension(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const CustomAppBar(),
                SizedBox(
                  height: appDimension.height * 0.01,
                ),
                const AdsContainer(),
                SizedBox(
                  height: appDimension.height * 0.023,
                ),

                 Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Categories",style:TextStyle(
                      fontFamily: GoogleFonts.rubik().fontFamily,
                      fontSize: 16
                    ) ,)),
                SizedBox(
                  height:appDimension.height * 0.01 ,
                ),
                const CustomListView(),
                 SizedBox(
                  height:appDimension.height * 0.01 ,
                ),
                Row(
                  children: [
                    Text(
                      "Top Deals",
                        style:TextStyle(
                            fontFamily: GoogleFonts.rubik().fontFamily,
                            fontSize: 16,
                        ),
                    ),
                    const Spacer(),
                    TextButton(onPressed: () {}, child: Text("View All"
                    ,style:TextStyle(
                            fontFamily: GoogleFonts.rubik().fontFamily,
                            fontSize: 16
                        )))
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
