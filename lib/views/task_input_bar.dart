import 'package:flutter/material.dart';
import 'package:simple_todo_calendar/core/app_logger.dart';

class TaskInputBar extends StatefulWidget {
  const TaskInputBar({super.key});

  @override
  State<TaskInputBar> createState() => _TaskInputBarState();
}

class _TaskInputBarState extends State<TaskInputBar> {
  final TextEditingController textController = TextEditingController();
  int lineCount = 1;
  double textFieldWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              height: 20 + (lineCount * 18),
              margin: const EdgeInsets.symmetric(
                vertical: 7,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffededed),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  textFieldWidth = constraints.maxWidth;

                  logger.d(textFieldWidth);

                  return TextField(
                    controller: textController,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: lineCount + 1,
                    autocorrect: false,
                    style: const TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      decorationThickness: 0,
                    ),
                    onChanged: (inputText) {
                      List<String> inputValue = inputText.split('\n');
                      String newText = inputText;

                      TextPainter textPainter = TextPainter(
                        textDirection: TextDirection.ltr,
                        textScaler: TextScaler.linear(
                          MediaQuery.textScalerOf(context).scale(1),
                        ),
                      );

                      String currentLineText = inputValue.last;
                      logger.d(currentLineText);

                      textPainter.text = TextSpan(
                        text: currentLineText,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      );

                      textPainter.layout(maxWidth: textFieldWidth - 30);

                      logger.d(textPainter.width);
                      logger.d(textPainter.height);

                      int currentLineCount = inputValue.length;
                    
                      if (currentLineCount == lineCount && (textFieldWidth - 30) * 0.9 < textPainter.width) {
                        newText += '\n';
                        currentLineCount += 1;
                      }

                      logger.d(currentLineCount);

                      if (inputText != newText) {
                        textController.text = newText;
                        textController.selection = TextSelection.fromPosition(
                          TextPosition(
                            offset: textController.text.length,
                          ),
                        );
                      }

                      setState(() {
                        lineCount = currentLineCount;
                      });
                    },
                    cursorColor: Colors.blue,
                    decoration: const InputDecoration(
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
                  );
                },
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
    );
  }
}
