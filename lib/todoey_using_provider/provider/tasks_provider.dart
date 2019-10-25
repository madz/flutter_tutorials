import 'dart:collection';

import 'package:app_brewery_tutorial/todoey_using_provider/model/task.dart';
import 'package:flutter/foundation.dart';

class TasksProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get taskList {
    return UnmodifiableListView(_tasks);
  }

  void addTask(String taskName) {
    _tasks.add(
      Task(name: taskName),
    );
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();

    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);

    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }
}
