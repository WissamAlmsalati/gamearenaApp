import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controler/navigaton_screen_cubit/navigationcontrol_cubit.dart';

class MyBouttomNavBar extends StatelessWidget {
  const MyBouttomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationcontrolCubit, NavigationcontrolState>(
      builder: (context, state) {
        return BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: state.index,
          onTap: (index) {
            context.read<NavigationcontrolCubit>().changeIndex(index);
          },
          items:  [
            BottomNavigationBarItem(
              icon: Icon(
                EneftyIcons.home_2_outline,
                color: state.index == 0 ? Colors.yellow[800] : Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EneftyIcons.search_normal_2_outline,
                color: state.index == 1 ? Colors.yellow[800] : Colors.black,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EneftyIcons.shopping_cart_outline,
                color: state.index == 2 ? Colors.yellow[800] : Colors.black,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                EneftyIcons.profile_outline,
                color: state.index == 3 ? Colors.yellow[800] : Colors.black,
              ),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
