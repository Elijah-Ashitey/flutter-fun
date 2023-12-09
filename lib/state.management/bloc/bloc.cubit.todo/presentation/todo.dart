import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fun/state.management/bloc/bloc.cubit.todo/cubit/todo.cubit.dart';
import 'package:flutter_fun/state.management/bloc/bloc.cubit.todo/model/todo.model.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TextEditingController controller = TextEditingController();
  final TodoCubit _todoCubit = TodoCubit();
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
          onPressed: () {
            _todoCubit.addTodo(controller.text.trim());
            controller.clear();
          },
          child: const Text("Add Todo"),
        ),
        BlocBuilder(
          bloc: _todoCubit,
          builder: (context, List<TodoModel> state) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state[index].activity),
                  trailing: IconButton(
                    onPressed: () {
                      // _todoCubit.delete(state[index]);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          },
        )
      ]),
    );
  }
}
