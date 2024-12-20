import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo_calendar/models/todo_item.dart';
import 'package:simple_todo_calendar/views/expandable_daily_todo_tile.dart';

class DailyTaskFeedView extends StatefulWidget {
  final DateTime selectedDate;
  final List<TodoItem>? todoItems;

  const DailyTaskFeedView({
    required this.selectedDate,
    this.todoItems,
    super.key,
  });

  @override
  State<DailyTaskFeedView> createState() => _DailyTaskFeedViewState();
}

class _DailyTaskFeedViewState extends State<DailyTaskFeedView> {
  late List<TodoItem> todoItems;
  late List<MapEntry<String, List<TodoItem>>> todoItemsGroupByDate;

  @override
  void initState() {
    super.initState();
    todoItems = widget.todoItems ?? [];
    todoItemsGroupByDate =
        groupBy(todoItems, (item) => item.date).entries.toList();
    print(todoItemsGroupByDate);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoItemsGroupByDate.length,
      itemBuilder: (context, index) {
        var dailyTodoList = todoItemsGroupByDate[index];
        
        return ExpandableDailyTodoTile(
          title: dailyTodoList.key,
          todoItems: dailyTodoList.value,
        );
      },
    );
  }
}
