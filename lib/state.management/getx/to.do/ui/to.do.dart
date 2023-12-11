import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.services.dart';
import 'package:get/get.dart';

import '../services/notification.services.dart';
import '../widget/add.date.bar.dart';
import '../widget/add.task.bar.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  NotifyHelper notifyer = NotifyHelper();
  @override
  void initState() {
    super.initState();
    notifyer.initializeNotification();
    if (Platform.isAndroid) {
      notifyer.requestIOSPermissions();
    } else if (Platform.isIOS) {
      notifyer.requestAndroidPermissions();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.theme.colorScheme.background,
        leading: GestureDetector(
          onTap: () {
            HapticFeedback.mediumImpact();
            ThemeServices().switchTheme();
            notifyer.displayNotification(
              title: "Notification Theme Change",
              body: !Get.isDarkMode
                  ? "Dark Mode Activated"
                  : "Light Mode Activated",
            );
            notifyer.scheduledNotification();
          },
          child: Icon(
            Get.isDarkMode ? Icons.sunny : Icons.nightlight_round,
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
      body: const Column(children: [
        AddTaskBar(),
        AddDateBar(),
      ]),
    );
  }
}
