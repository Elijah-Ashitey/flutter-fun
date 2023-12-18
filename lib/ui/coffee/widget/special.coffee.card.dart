import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../utils/color.theme.dart';

class SpecialCoffeeCard extends StatelessWidget {
  const SpecialCoffeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: CoffeeColorTheme.lightBlueColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "${uiImage}coffee2.jpg",
            width: Get.size.width * 0.4,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "5 Coffee Beans You Must Try !",
              style: CoffeeColorTheme.normalTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: '\$', // default text style
                    style: CoffeeColorTheme.normalTextStyle.copyWith(
                      color: CoffeeColorTheme.lightPColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                    children: [
                      TextSpan(
                        text: ' 4.20',
                        style: CoffeeColorTheme.normalTextStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: CoffeeColorTheme.pColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ))
      ]),
    );
  }
}
