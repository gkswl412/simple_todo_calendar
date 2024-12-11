import 'package:flutter/material.dart';
import 'package:simple_todo_calendar/models/todo_item.dart';
import 'package:simple_todo_calendar/views/daily_timeline_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Custom Calendar"),
          ),
          body: DailyTimelineView(
            selectedDate: DateTime.now(),
            todoItems: [
              TodoItem(
                note: '본가에 폐가전 배출 요청 전화하기',
                time: DateTime.now(),
                isDone: false,
              ),
              TodoItem(
                note: '영화 관람',
                time: DateTime.now(),
                isDone: false,
              ),
              TodoItem(
                note: '귀가후 카레에 밥 먹기',
                time: DateTime.now(),
                isDone: false,
              ),
              TodoItem(
                note: '개발 계획 세우기',
                time: DateTime.now(),
                isDone: false,
              ),
            ],
          )),
    );
  }
}
