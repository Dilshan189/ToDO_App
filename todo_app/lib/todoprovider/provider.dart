import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_app/model/modol.dart';


class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  final String apiUrl = 'http://10.0.2.2:8080/api/todos';


  List<Todo> get todos => _todos;

  Future<void> fetchTodos() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonData = jsonDecode(response.body);
      _todos = jsonData.map((e) => Todo.fromJson(e)).toList();
      notifyListeners();
    }
  }

  Future<void> addTodo(String title) async {
    final response = await http.post(Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': title, 'completed': false}),
    );
    if (response.statusCode == 200) {
      fetchTodos();
    }
  }

  Future<void> deleteTodo(int id) async {
    await http.delete(Uri.parse('$apiUrl/$id'));
    fetchTodos();
  }
}
