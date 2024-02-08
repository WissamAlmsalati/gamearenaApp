import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controler/navigaton_screen_cubit/navigationcontrol_cubit.dart';

class MyBouttomNavBar extends StatelessWidget {
  const MyBouttomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationcontrolCubit, NavigationcontrolState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.index,
          onTap: (index) {
            context.read<NavigationcontrolCubit>().changeIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.lightBlue,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.lightBlue,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.lightBlue,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.lightBlue,
              ),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}
