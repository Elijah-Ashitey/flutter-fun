import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/todo.model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String todo) {
    TodoModel todo0 = TodoModel(activity: todo, date: DateTime.now());

    emit([...state, todo0]);
  }
}
