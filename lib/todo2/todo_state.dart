import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> _todos;
  List<String>get todos => _todos ;
  const TodoState(this._todos);

  @override
  List<Object> get props => [todos];
}
