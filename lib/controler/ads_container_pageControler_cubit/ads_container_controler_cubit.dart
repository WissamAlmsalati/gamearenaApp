import 'dart:async';

import 'package:bloc/bloc.dart';

part 'ads_container_controler_state.dart';

class PageCubit extends Cubit<PageState> {
  Timer? _timer;

  PageCubit() : super(PageState(0)) {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      nextPage();
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  void nextPage() {
    if (state.currentPage < 4) {
      emit(PageState(state.currentPage + 1));
    } else {
      emit(PageState(0));
    }
  }
}