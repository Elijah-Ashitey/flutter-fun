import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.services.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            ThemeServices().switchTheme();
          },
          child: const Icon(
            Icons.nightlight_round,
            size: 20,
          ),
        ),
        actions: const [
          Icon(
            Icons.person,
            size: 20,
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
