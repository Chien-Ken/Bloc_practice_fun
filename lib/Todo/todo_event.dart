abstract class TodoEvent {
}

class AddTodo extends TodoEvent {
final String todo;
AddTodo(this.todo);
}

class RemoveTodo extends TodoEvent {
final int index;
RemoveTodo(this.index);
}

class ToggleTodo extends TodoEvent {
  final int index;
  ToggleTodo(this.index);
}

