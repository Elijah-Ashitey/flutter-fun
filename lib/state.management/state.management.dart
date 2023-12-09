import 'package:flutter/material.dart';
import 'package:flutter_fun/models/ui.model.dart';
import 'package:flutter_fun/state.management/bloc/bloc.login.validation/presentation/login.screen.dart';

import 'bloc/bloc.counter.app/presentation/counter.page.dart';
import 'bloc/bloc.cubit.todo/presentation/todo.dart';
import 'getx/to.do/ui/to.do.dart';

class StateManagement extends StatefulWidget {
  const StateManagement({super.key});

  @override
  State<StateManagement> createState() => _StateManagementState();
}

class _StateManagementState extends State<StateManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          Container(
            height: 150,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: ListView(padding: EdgeInsets.zero, children: [
                ...ui
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => e.screen),
                                  );
                                },
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(e.image),
                                ),
                                title: Text(e.title),
                                subtitle: Text(e.description),
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right)),
                          ),
                        ))
                    .toList()
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

List<UIModel> ui = [
  UIModel(
    title: 'Counter Bloc App',
    description: 'A simple counter application using Bloc ',
    image: "https://source.unsplash.com/user/c_v_r/100x100",
    screen: const CounterApp(
      title: "Counter Application",
    ),
  ),
  UIModel(
    title: 'Simple Todo Bloc App',
    description: 'A simple todo application using Bloc ',
    image: "https://source.unsplash.com/user/c_v_r/100x100",
    screen: const TodoScreen(),
  ),
  UIModel(
    title: 'Login Validation Bloc App',
    description: 'A simple login application using Bloc ',
    image: "https://source.unsplash.com/user/c_v_r/100x100",
    screen: const LoginScreen(),
  ),
  UIModel(
    title: 'Task Management Application',
    description: 'A simple todo using GET X ',
    image: "https://source.unsplash.com/user/c_v_r/100x100",
    screen: const ToDoApp(),
  ),
];
