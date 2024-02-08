part of 'navigationcontrol_cubit.dart';

@immutable
abstract class NavigationcontrolState {
  final int index;
  NavigationcontrolState(this.index);
}

class NavigationcontrolInitial extends NavigationcontrolState {
  NavigationcontrolInitial() : super(0);
}

class NavigationcontrolHome extends NavigationcontrolState {
  NavigationcontrolHome(int index) : super(index);
}

class NavigationcontrolSearch extends NavigationcontrolState {
  NavigationcontrolSearch(int index) : super(index);
}

class NavigationcontrolCart extends NavigationcontrolState {
  NavigationcontrolCart(int index) : super(index);
}

class NavigationcontrolProfile extends NavigationcontrolState {
  NavigationcontrolProfile(int index) : super(index);
}