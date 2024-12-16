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
  late String note;
  bool isEditing = false;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    isDone = widget.todoItem.isDone;
    note = widget.todoItem.note;
    textController = TextEditingController(
      text: note,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1,
          style: BorderStyle.solid,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Row(
        children: [
          Checkbox(
            value: isDone,
            onChanged: (value) {
              setState(() {
                FocusScope.of(context).unfocus();
                isDone = !isDone;
              });
            },
          ),
          Expanded(
            child: Container(
              child: TextField(
                controller: textController,
                style: TextStyle(
                  decoration:
                      isDone ? TextDecoration.lineThrough : TextDecoration.none,
                  fontSize: 20,
                  height: 2,
                ),
                decoration: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
