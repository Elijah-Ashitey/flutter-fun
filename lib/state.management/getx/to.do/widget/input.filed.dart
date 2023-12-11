import 'package:flutter/material.dart';
import 'package:flutter_fun/state.management/getx/to.do/services/theme.dart';
import 'package:get/get.dart';

class MyInputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final String hint;
  final Widget? widget;
  const MyInputField(
      {super.key,
      required this.label,
      this.controller,
      required this.hint,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          label,
        ),
        Container(
          padding: const EdgeInsets.only(left: 14),
          height: 52,
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget == null,
                  autofocus: false,
                  controller: controller,
                  cursorColor: Get.isDarkMode
                      ? Colors.grey.shade100
                      : Colors.grey.shade400,
                  style: subTitleStyle,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: subTitleStyle,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    //  UnderlineInputBorder(
                    //   borderSide: BorderSide(
                    //     color: context.theme.colorScheme.background,
                    //     width: 0,
                    //   ),
                    // ),
                  ),
                ),
              ),
              if (widget != null) ...{
                widget!,
              }
            ],
          ),
        )
      ]),
    );
  }
}
