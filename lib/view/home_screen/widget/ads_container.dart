import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Constants/constans.dart';
import 'package:store/localy_lists.dart';

import '../../../controler/ads_container_pageControler_cubit/ads_container_controler_cubit.dart';

class AdsContainer extends StatelessWidget {
  const AdsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppDimension appDimension = AppDimension(context);
    final pageController = PageController();
    return BlocProvider(
      create: (BuildContext context) {
        return PageCubit();
      },
      child: Container(
        height: appDimension.height * 0.17,
        child: BlocListener<PageCubit, PageState>(
          listener: (context, state) {
            pageController.animateToPage(
              state.currentPage,
              duration: Duration(milliseconds: 450),
              curve: Curves.easeInCubic,
            );
          },
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: ads.adsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: appDimension.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    ads.adsList[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
