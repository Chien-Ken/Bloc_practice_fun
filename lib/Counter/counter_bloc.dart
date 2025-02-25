import 'dart:async';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc {
  int _counter = 0;

  // StreamController để quản lý sự kiện và trạng thái
  // quản lý state
  final _counterStateController = StreamController<CounterState>();
  Stream<CounterState> get counterStream => _counterStateController.stream;
  // quản lý event
  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  // Constructor để lắng nghe sự kiện
  CounterBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementCounter) {
      _handleIncrease();    
    }else if (event is DecreaseCounter) {
     _handleDecrease();
    }else if (event is ResetCounter) {
      _handleReset();
    }
    _counterStateController.add(CounterState(_counter));
  }

  void _handleIncrease() {
    _counter++;
  }
  void _handleDecrease(){
    if(_counter > 0) {
      _counter--;
    }
  }
  void _handleReset() {
    _counter = 0;
  }



  // Đóng stream khi không cần dùng nữa
  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}