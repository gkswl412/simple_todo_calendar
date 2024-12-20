import 'package:flutter/material.dart';
import 'package:simple_todo_calendar/models/todo_item.dart';
import 'package:simple_todo_calendar/views/todo_card_view.dart';

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

  @override
  void initState() {
    super.initState();
    todoItems = widget.todoItems ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoItems.length,
      itemBuilder: (context, index) {
        String currentItemDate = todoItems[index].date;

        // 이전 항목의 날짜를 가져오기
        String previousItemDate = index > 0 ? todoItems[index - 1].date : "";

        // 날짜가 바뀌면 헤더를 추가
        if (currentItemDate != previousItemDate) {
          return Column(
            children: [
              // 날짜를 헤더로 표시
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                color: Colors.grey[300],
                child: Text(
                  currentItemDate,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              // 해당 날짜의 아이템
              ListTile(
                title: Text(todoItems[index].note),
              ),
            ],
          );
        }

        // 날짜가 같으면 그냥 아이템만 표시
        return ListTile(
          title: Text(todoItems[index].note),
        );
      },
    );
  }
}
