import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  TaskTile({
    @required this.isChecked,
    @required this.taskTitle,
    @required this.checkboxCallback,
    @required this.longPressCallback,
  });

  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: longPressCallback,
    );
  }
}
