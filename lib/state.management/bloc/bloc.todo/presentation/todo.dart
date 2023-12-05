import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo Application'),
      ),
      body: Column(children: [
        TextField(
          controller: controller,
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Add Todo"),
        )
      ]),
    );
  }
}
