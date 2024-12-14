import 'package:flutter/material.dart';
import 'package:simple_todo_calendar/models/todo_item.dart';
import 'package:simple_todo_calendar/views/todo_card_view.dart';

class DailyTimelineView extends StatefulWidget {
  final DateTime selectedDate;
  final List<TodoItem>? todoItems;

  const DailyTimelineView({
    required this.selectedDate,
    this.todoItems,
    super.key,
  });

  @override
  State<DailyTimelineView> createState() => _DailyTimelineViewState();
}

class _DailyTimelineViewState extends State<DailyTimelineView> {
  late List<TodoItem> todoItems;

  @override
  void initState() {
    super.initState();
    todoItems = widget.todoItems ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              widget.selectedDate.toIso8601String(),
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          ...todoItems.map(
            (item) => TodoCardView(
              todoItem: item,
            ),
          ),
        ],
      ),
    );
  }
}
