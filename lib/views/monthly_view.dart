import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthlyView extends StatelessWidget {
  const MonthlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Month and Year
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            DateFormat.yMMMM().format(DateTime.now()),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        // Weekday Labels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
              .map((day) => Text(day,
                  style: const TextStyle(fontWeight: FontWeight.bold)))
              .toList(),
        ),
        // Calendar Grid
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7),
            itemCount: 42, // 6 weeks * 7 days
            itemBuilder: (context, index) {
              // Replace with your logic to compute the day
              return Center(child: Text("${index + 1}"));
            },
          ),
        ),
      ],
    );
  }
}
