import 'package:flutter/material.dart';
import 'package:flutter_fun/constants.dart';

class CardBack extends StatelessWidget {
  const CardBack({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
                image: AssetImage(
              '${uiImage}card.back.jpg',
            ))),
        height: 150,
        width: 100,
      ),
    );
  }
}
