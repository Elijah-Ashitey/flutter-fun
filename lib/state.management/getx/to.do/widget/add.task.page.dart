import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/controllers/task.controller.dart';
import 'package:flutter_fun/state.management/getx/to.do/models/task.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.dart';
import 'package:flutter_fun/state.management/getx/to.do/widget/button.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'input.filed.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  DateTime selectedDate = DateTime.now();
  String _endTime = "9:30 PM";
  String _startTime = DateFormat('hh:mm a').format(DateTime.now());
  int _selectedRemind = 5;
  int _selectedColor = 0;
  List<int> remindList = [
    5,
    10,
    15,
    20,
  ];

  String _selectedRepeat = "None";
  List<String> repeatList = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
  final TextEditingController _titleCnt = TextEditingController();
  final TextEditingController _noteCnt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.colorScheme.background,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Add Task",
              style: headingStyle,
            ),
            MyInputField(
              controller: _titleCnt,
              hint: 'Enter title here',
              label: 'title',
            ),
            MyInputField(
              hint: 'Enter note here',
              label: 'Note',
              controller: _noteCnt,
            ),
            MyInputField(
              hint: DateFormat.yMd().format(selectedDate),
              label: 'Date',
              widget: IconButton(
                icon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey,
                ),
                onPressed: () {
                  _getDateFromUser();
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MyInputField(
                    hint: _startTime,
                    label: 'Start Time',
                    widget: IconButton(
                      icon: const Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                      onPressed: () async {
                        String? time = await _getTimeFromUser();
                        if (time != null) {
                          setState(() {
                            _startTime = time;
                          });
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: MyInputField(
                    hint: _endTime,
                    label: 'End Time',
                    widget: IconButton(
                      icon: const Icon(
                        Icons.access_time_rounded,
                        color: Colors.grey,
                      ),
                      onPressed: () async {
                        String? time = await _getTimeFromUser();
                        if (time != null) {
                          setState(() {
                            _endTime = time;
                          });
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            MyInputField(
              hint: '$_selectedRemind minutes early',
              label: 'Remind',
              widget: DropdownButton(
                items: remindList
                    .map((e) => DropdownMenuItem(
                          value: e.toString(),
                          child: Text(
                            "$e",
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ))
                    .toList(),
                elevation: 4,
                iconSize: 32,
                style: subTitleStyle,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey,
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedRemind = int.tryParse(value.toString()) ?? 5;
                  });
                },
              ),
            ),
            MyInputField(
              hint: '$_selectedRepeat ',
              label: 'Repeat',
              widget: DropdownButton(
                items: repeatList
                    .map((e) => DropdownMenuItem(
                          value: e.toString(),
                          child: Text(
                            e,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ))
                    .toList(),
                elevation: 4,
                iconSize: 32,
                style: subTitleStyle,
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.grey,
                ),
                onChanged: (value) {
                  setState(() {
                    _selectedRepeat = value.toString();
                  });
                },
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    "Color",
                    style: titleStyle,
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: List<Widget>.generate(
                      3,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColor = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: index == 0
                                ? primaryClr
                                : index == 1
                                    ? pinkClr
                                    : yellowishClr,
                            child: _selectedColor == index
                                ? const Icon(
                                    Icons.done,
                                    size: 16,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
                MyButton(
                  label: 'Create Task',
                  onTap: _validateDate,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  _validateDate() {
    if (_titleCnt.text.isNotEmpty && _noteCnt.text.isNotEmpty) {
      _addTaskToDb();
    } else if (_titleCnt.text.isEmpty || _noteCnt.text.isEmpty) {
      Get.snackbar(
        "Required",
        "All fields are required",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: pinkClr, // Colors.black,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
      );
    }
  }

  _getDateFromUser() async {
    DateTime? pickerData = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015),
      lastDate: DateTime(2121),
    );

    if (pickerData != null) {
      setState(() {
        selectedDate = pickerData;
      });
    }
  }

  _addTaskToDb() async {
    int value = await _taskController.addTask(Task(
      title: _titleCnt.text,
      note: _noteCnt.text,
      isCompleted: 0,
      date: DateFormat.yMd().format(selectedDate),
      startTime: _startTime,
      endTime: _endTime,
      color: _selectedColor,
      remind: _selectedRemind,
      repeat: _selectedRepeat,
    ));
    if (value > 0) {
      Get.back();
      Get.snackbar(
        "Success",
        "Task Added Successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: Colors.white,
        ),
      );
    } else {
      Get.snackbar(
        "Failed",
        "Task Failed to Add",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: pinkClr, // Colors.black,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.red,
        ),
      );
    }
  }

  Future<String?> _getTimeFromUser() async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: TimeOfDay(
        hour: int.tryParse(_startTime.split(":")[0]) ?? 9,
        minute: int.tryParse(_startTime.split(":")[1].split(" ")[0]) ?? 10,
      ),
    );
    if (time == null) {
      return null;
    } else {
      // ignore: use_build_context_synchronously
      return time.format(context);
    }
  }
}
