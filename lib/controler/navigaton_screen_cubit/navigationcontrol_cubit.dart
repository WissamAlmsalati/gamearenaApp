import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigationcontrol_state.dart';

class NavigationcontrolCubit extends Cubit<NavigationcontrolState> {
  NavigationcontrolCubit() : super(NavigationcontrolInitial());

  void changeIndex(int index) {
    switch (index) {
      case 0:
        emit(NavigationcontrolHome(index));
        break;
      case 1:
        emit(NavigationcontrolSearch(index));
        break;
      case 2:
        emit(NavigationcontrolCart(index));
        break;
      case 3:
        emit(NavigationcontrolProfile(index));
        break;
    }
  }
}

