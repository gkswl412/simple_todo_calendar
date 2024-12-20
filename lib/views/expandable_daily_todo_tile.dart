import 'package:flutter/material.dart';
import 'package:simple_todo_calendar/models/todo_item.dart';

class ExpandableDailyTodoTile extends StatelessWidget {
  final String title;
  final List<TodoItem> todoItems;

  const ExpandableDailyTodoTile({
    required this.title,
    required this.todoItems,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: todoItems.map((item) => Text(item.note)).toList(),
    );
  }
}
