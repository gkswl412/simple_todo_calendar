import 'package:flutter/material.dart';
import 'package:simple_todo_calendar/models/todo_item.dart';
import 'package:simple_todo_calendar/views/daily_task_feed_view.dart';

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
        bottomSheet: Container(
          color: Colors.white,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  debugPrint('open Calendar!');
                },
                icon: const Icon(
                  Icons.calendar_month_rounded,
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  margin: const EdgeInsets.symmetric(
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffededed),
                  ),
                  child: const TextField(
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                      hintText: '할 일 입력',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  debugPrint('Add!');
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
