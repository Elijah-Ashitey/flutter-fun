import 'dart:math';

import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  final String suit;
  final Color color;
  final String number;
  const CardTemplate(
      {super.key,
      required this.suit,
      required this.color,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: 150,
      width: 100,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ],
        ),
        Text(
          suit,
          style: TextStyle(
            fontSize: 60,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.rotate(
              angle: pi,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  number,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

const String spade = '♠️';
const String heart = '♥️';
const String diamond = '♦️';
const String club = '♣️';

//  ♠️  spade
//  ♥️  Hearts
//  ♦️  Diamons
//  ♣️  Clubs