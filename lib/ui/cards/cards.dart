import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fun/ui/cards/widget/card.template.dart';

import 'widget/my.card.dart';

class BlackJack extends StatefulWidget {
  const BlackJack({super.key});

  @override
  State<BlackJack> createState() => _BlackJackState();
}

class _BlackJackState extends State<BlackJack>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(
          milliseconds: 200,
        ),
        vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      body: (_animationController == null || _animation == null)
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardTemplate(
                      suit: spade,
                      color: Colors.red,
                      number: '7',
                    ),
                    CardTemplate(
                      suit: club,
                      color: Colors.black,
                      number: '10',
                    ),
                  ],
                ),
                Transform.rotate(
                  angle: pi / 2,
                  child: const CardBack(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    getFlippingCard(
                      '7',
                      spade,
                      Colors.red,
                    ),
                    getFlippingCard(
                      '10',
                      club,
                      Colors.black,
                    ),
                  ],
                )
              ],
            ),
    );
  }

  Widget getFlippingCard(String number, String suit, Color color) {
    return Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.002)
          ..rotateY(pi * _animation!.value),
        alignment: FractionalOffset.center,
        child: GestureDetector(
          onTap: () {
            if (_animationStatus == AnimationStatus.dismissed) {
              _animationController!.forward();
            } else {
              _animationController!.reverse();
            }
          },
          child: _animation!.value <= 0.5
              ? CardTemplate(
                  suit: suit,
                  color: color,
                  number: number,
                )
              : const CardBack(),
        ));
  }
}
