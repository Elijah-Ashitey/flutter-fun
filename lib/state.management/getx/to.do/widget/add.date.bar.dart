import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/controllers/task.controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/theme.dart';

class AddDateBar extends StatefulWidget {
  const AddDateBar({super.key});

  @override
  State<AddDateBar> createState() => _AddDateBarState();
}

class _AddDateBarState extends State<AddDateBar> {
  final TaskController _taskController = Get.put(TaskController());
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 20),
      decoration: const BoxDecoration(),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        selectedTextColor: Colors.white,
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        onDateChange: (DateTime date) {
          selectedDate = date;
          _taskController.updateDate(date);
        },
      ),
    );
  }
}
