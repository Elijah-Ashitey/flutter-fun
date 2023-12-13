import 'package:flutter_fun/constants.dart';
import 'package:flutter_fun/state.management/getx/to.do/db/db_helper.dart';
import 'package:flutter_fun/state.management/getx/to.do/models/task.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  @override
  void onReady() {
    getTask();
    super.onReady();
  }

  var taskList = <Task>[].obs;
  Future<int> addTask(Task task) async {
    return await DBHelper.insert(task);
  }

  void getTask() async {
    List<Task> task = await DBHelper.queryAllTasks();
    logger.i("all task from controller  ${task.length}");
    taskList.addAll(task);
    logger.i("all task after assignment  ${taskList.length}");
  }
}
