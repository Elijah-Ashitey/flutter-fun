import 'package:flutter/material.dart';
import 'package:flutter_fun/constants.dart';
import 'package:flutter_fun/state.management/getx/to.do/controllers/task.controller.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';
import '../services/notification.services.dart';
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
        String selectedDate =
            DateFormat.yMd().format(_taskController.selectedDate.value);
        logger.e("date now is ${_taskController.selectedDate.value}");
        return ListView.builder(
            itemCount: _taskController.taskList.length,
            itemBuilder: (_, i) {
              Task task = _taskController.taskList[i];

              logger.d("${task.date}  ==  $selectedDate");

              if (task.repeat == "Daily") {
                String? myTime = task.startTime?.split(" ")[0];

                NotifyHelper().scheduledNotification(
                  int.tryParse(myTime!.split(":")[0]) ?? 12,
                  int.tryParse(myTime.split(":")[1]) ?? 12,
                  task,
                );

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
              }
              if (task.date == selectedDate) {
                logger.w(" Date is same for ${task.title}");
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
              }
              return Container();
            });
      }),
    );
  }

  _showBottomSheet(Task task) {
    Get.bottomSheet(Container(
      width: double.infinity,
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
        ),
        const Spacer(),
        task.isCompleted != 1
            ? _buttonSheetButton(
                color: primaryClr,
                label: "Task Completed",
                onTap: () {
                  _taskController.completedTask(task.id!);
                  Get.back();
                },
              )
            : const SizedBox(),
        _buttonSheetButton(
          color: Colors.red.shade300,
          label: "Delete Task",
          onTap: () {
            _taskController.deleteTask(task.id!);
            Get.back();
          },
        ),
        const SizedBox(height: 20),
        _buttonSheetButton(
          color: Colors.red,
          label: "Close ",
          isClose: true,
          onTap: () {
            Get.back();
          },
        ),
        const SizedBox(height: 10),
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
        width: double.infinity,
        height: 55,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isClose ? Colors.transparent : color,
          border: Border.all(
            width: 2,
            color: !isClose
                ? color
                : Get.isDarkMode
                    ? Colors.grey.shade600
                    : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: isClose
                ? titleStyle
                : titleStyle.copyWith(
                    color: Colors.white,
                  ),
          ),
        ),
      ),
    );
  }
}
