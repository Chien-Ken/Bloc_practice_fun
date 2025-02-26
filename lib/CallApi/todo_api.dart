import 'dart:convert';
import 'package:bloc_practice/CallApi/todo.dart';
import 'package:http/http.dart' as http;


class TodoService {
  final String apiUrl = "https://jsonplaceholder.typicode.com/todos";

  Future<List<Todo>> fetchTodos() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Todo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
