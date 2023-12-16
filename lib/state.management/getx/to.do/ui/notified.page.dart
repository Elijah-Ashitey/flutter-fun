import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/task.dart';
import '../widget/task.tile.dart';

class NotifiedPage extends StatelessWidget {
  final String? payload;
  const NotifiedPage({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {
    var data = json.decode(payload!);

    Task task = Task.fromMap(data as Map<String, dynamic>);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        backgroundColor: bgColor(task.color!),
        title: Text(
          '${task.title}',
          style: subHeadingStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Text(
            "Hello, Elijah Ashitey",
            style: GoogleFonts.lato(
                textStyle: TextStyle(
              color: !Get.isDarkMode ? Colors.black : Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
          ),
          Text(
            "You have a new reminder",
            style: subHeadingStyle.copyWith(
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
          ),
          Center(
              child: Container(
            height: 500,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: bgColor(task.color!),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                _TaskDetails(
                  icon: Icons.text_rotation_none_rounded,
                  subtitle: '${task.title}',
                  title: 'Title',
                ),
                _TaskDetails(
                  icon: Icons.receipt_long,
                  subtitle: '${task.note}',
                  title: 'Description',
                ),
                _TaskDetails(
                  icon: Icons.date_range,
                  subtitle: '${task.startTime}',
                  title: 'Date',
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class _TaskDetails extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const _TaskDetails(
      {required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      title: Text(
        title,
        style: subHeadingStyle.copyWith(
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: subHeadingStyle.copyWith(
          color: Colors.white,
          fontSize: 15,
        ),
      ),
    );
  }
}
