import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/widget/add.task.page.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../services/theme.dart';
import 'button.dart';

class AddTaskBar extends StatelessWidget {
  const AddTaskBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              Text(
                "Today",
                style: headingStyle,
              )
            ],
          ),
          MyButton(
              label: '+ Add Task',
              onTap: () {
                Get.to(const AddTaskPage());
              })
        ],
      ),
    );
  }
}
