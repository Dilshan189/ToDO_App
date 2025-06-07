import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/todoprovider/provider.dart';
import 'package:todo_app/todoscreen.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoProvider(), 
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO App',
      home: TodoScreen(), // Now this has access to the Provider above
    );
  }
}
