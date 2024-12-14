import 'package:flutter/material.dart';
import 'package:simple_todo_calendar/models/todo_item.dart';

class TodoCardView extends StatefulWidget {
  final TodoItem todoItem;

  const TodoCardView({
    required this.todoItem,
    super.key,
  });

  @override
  State<TodoCardView> createState() => _TodoCardViewState();
}

class _TodoCardViewState extends State<TodoCardView> {
  late bool isDone;

  @override
  void initState() {
    super.initState();
    isDone = widget.todoItem.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
            value: isDone,
            onChanged: (value) {
              setState(() {
                isDone = !isDone;
              });
            },
          ),
          Text(
            widget.todoItem.note,
            style: TextStyle(
              decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
