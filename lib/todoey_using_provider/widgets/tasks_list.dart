import 'package:app_brewery_tutorial/todoey_using_provider/model/task.dart';
import 'package:app_brewery_tutorial/todoey_using_provider/provider/tasks_provider.dart';
import 'package:app_brewery_tutorial/todoey_using_provider/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(builder: (context, taskProvider, child) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          Task task = taskProvider.taskList[index];
          return TaskTile(
            isChecked: task.isDone,
            taskTitle: task.name,
            checkboxCallback: (bool checkBoxState) {
              taskProvider.updateTask(task);
            },
            longPressCallback: () {
              taskProvider.deleteTask(task);
            },
          );
        },
        itemCount: taskProvider.taskCount,
      );
    });
  }
}
