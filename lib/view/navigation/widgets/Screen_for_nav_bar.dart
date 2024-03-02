import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controler/navigaton_screen_cubit/navigationcontrol_cubit.dart';
import '../../cart_screen/cart_screen.dart';
import '../../home_screen/home_screen.dart';
import '../../profile_screen/profile_screen.dart';
import '../../search_screen/search_screen.dart';


class AppMainScreens extends StatelessWidget {
  const AppMainScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      const HomeScreen(),
       SearchScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
    return BlocBuilder<NavigationcontrolCubit, NavigationcontrolState>(
      builder: (BuildContext context, state) => _screens[state.index],
    );
  }
}
