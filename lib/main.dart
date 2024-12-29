import 'package:flutter/material.dart';
import 'package:simple_todo_calendar/models/todo_item.dart';
import 'package:simple_todo_calendar/views/daily_task_feed_view.dart';
import 'package:simple_todo_calendar/views/task_input_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: TextScaler.linear(
              MediaQuery.textScalerOf(context).scale(1),
            ),
          ),
          child: child!,
        );
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Calendar"),
        ),
        body: DailyTaskFeedView(
          selectedDate: DateTime.now(),
          todoItems: [
            TodoItem(
              note: '본가에 폐가전 배출 요청 전화하기',
              time: DateTime.now(),
              date: '2024-12-20',
              isDone: false,
            ),
            TodoItem(
              note: '영화 관람',
              time: DateTime.now(),
              date: '2024-12-20',
              isDone: false,
            ),
            TodoItem(
              note: '귀가후 카레에 밥 먹기',
              time: DateTime.now(),
              date: '2024-12-21',
              isDone: false,
            ),
            TodoItem(
              note: '개발 계획 세우기',
              time: DateTime.now(),
              date: '2024-12-23',
              isDone: false,
            ),
          ],
        ),
        bottomSheet: const TaskInputBar(),
      ),
    );
  }
}
