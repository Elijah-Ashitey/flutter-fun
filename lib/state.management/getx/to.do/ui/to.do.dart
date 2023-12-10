import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.services.dart';
import 'package:get/get.dart';

import '../services/notification.services.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  NotifyHelper notifyer = NotifyHelper();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyer.initializeNotification();
    notifyer.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            ThemeServices().switchTheme();
            notifyer.displayNotification(
              title: "Notification Theme Change",
              body: !Get.isDarkMode
                  ? "Dark Mode Activated"
                  : "Light Mode Activated",
            );
          },
          child: const Icon(
            Icons.nightlight_round,
            size: 20,
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
    );
  }
}
