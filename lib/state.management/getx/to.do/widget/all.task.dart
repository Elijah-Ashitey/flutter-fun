import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/controllers/task.controller.dart';
import 'package:get/get.dart';

class AllMyTask extends StatefulWidget {
  const AllMyTask({super.key});

  @override
  State<AllMyTask> createState() => _AllMyTaskState();
}

class _AllMyTaskState extends State<AllMyTask> {
  final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, c) {
              return Container(
                width: 100,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
              );
            });
      }),
    );
  }
}
