import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/todo.model.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String todo) {
    if (todo.isEmpty) {
      addError('Title cannot be empty!!');
      return;
    }
    TodoModel todo0 = TodoModel(activity: todo, date: DateTime.now());

    emit([...state, todo0]);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    super.onChange(change);
    print("TodoCubit -- $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("TodoCubit Error -- $error ");
  }
}
