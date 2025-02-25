import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit(super.initialState);

  void increasement() => emit(state +1);
  
  void decreasement() {
    if (state > 0) {  // ✅ Kiểm tra trước khi giảm
      emit(state - 1);
    }
  }

  void reset() => emit(0);

}