// counter_event.dart
abstract class CounterEvent {}


class IncrementCounter extends CounterEvent {}
class DecreaseCounter extends CounterEvent{}
class ResetCounter extends CounterEvent{}
