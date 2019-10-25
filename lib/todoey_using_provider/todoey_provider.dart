import 'package:app_brewery_tutorial/todoey_using_provider/provider/tasks_provider.dart';
import 'package:app_brewery_tutorial/todoey_using_provider/screen/tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => TasksProvider()),
      ],
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
