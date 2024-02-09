import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/view/navigation/widgets/Screen_for_nav_bar.dart';
import 'package:store/view/navigation/widgets/my_bouttom_nav_bar.dart';
import 'package:store/view/search_screen/search_screen.dart';
import '../../controler/navigaton_screen_cubit/navigationcontrol_cubit.dart';
import '../cart_screen/cart_screen.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';

class NavigationControl extends StatelessWidget {
  const NavigationControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationcontrolCubit(),
      child:const Scaffold(
        body:  AppMainScreens(),
        bottomNavigationBar:  MyBouttomNavBar(),
      ),
    );
  }
}
