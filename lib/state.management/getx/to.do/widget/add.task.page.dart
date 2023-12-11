import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'input.filed.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  DateTime selectedDate = DateTime.now();
  final String _endTime = "9:30 PM";
  // final String _startTime = DateFormat.jm().format(DateTime.now());
  final String _startTime = DateFormat('hh:mm a').format(DateTime.now());
  TextEditingController cnt = TextEditingController();
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
              controller: cnt,
              hint: 'Enter title here',
              label: 'title',
            ),
            const MyInputField(
              hint: 'Enter note here',
              label: 'Note',
            ),
            MyInputField(
              hint: DateFormat.yMd().format(DateTime.now()),
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
                      onPressed: () {
                        _getTimeFromUser();
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
                      onPressed: () {
                        _getTimeFromUser();
                      },
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
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

  _getTimeFromUser() {
    return showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.input,
      initialTime: const TimeOfDay(
        hour: 9,
        minute: 10,
      ),
    );
  }
}
