import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/controllers/task.controller.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import '../models/task.dart';
import 'task.tile.dart';

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
            itemBuilder: (_, i) {
              Task task = _taskController.taskList[i];
              return AnimationConfiguration.staggeredList(
                position: i,
                child: GestureDetector(
                  onTap: () {
                    _showBottomSheet(task);
                  },
                  child: SlideAnimation(
                      child: FadeInAnimation(
                    child: TaskTile(task: task),
                  )),
                ),
              );
            });
      }),
    );
  }

  _showBottomSheet(Task task) {
    Get.bottomSheet(Container(
      height: task.isCompleted == 1
          ? MediaQuery.of(context).size.height * 0.24
          : MediaQuery.of(context).size.height * 0.32,
      color: Get.isDarkMode ? darkGreyClr : Colors.white,
      padding: const EdgeInsets.only(top: 4),
      child: Column(children: [
        Container(
          height: 6,
          width: 120,
          decoration: BoxDecoration(
            color: Get.isDarkMode ? Colors.grey.shade600 : Colors.grey[300],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            _buttonSheetButton(
              color: Colors.red,
              label: "Delete Task",
              onTap: () {
                _taskController.deleteTask(task.id!);
                Get.back();
              },
            )
          ]),
        )
      ]),
    ));
  }

  _buttonSheetButton({
    required String label,
    required Color color,
    bool isClose = false,
    required Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isClose ? Colors.transparent : color,
          border: Border.all(
            width: 2,
            color: isClose ? Colors.grey.shade600 : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: isClose
              ? titleStyle
              : titleStyle.copyWith(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
