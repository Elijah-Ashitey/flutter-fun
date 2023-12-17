import 'package:flutter/material.dart';
import 'package:flutter_fun/constants.dart';
import 'package:flutter_fun/ui/black.jack.cards/black.cards.dart';

import '../models/ui.model.dart';
import 'coffee/coffee.dart';

class UICards extends StatefulWidget {
  const UICards({super.key});

  @override
  State<UICards> createState() => _UICardsState();
}

class _UICardsState extends State<UICards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Column(
        children: [
          Container(
            height: 150,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: ListView(padding: EdgeInsets.zero, children: [
                ...ui
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (_) => e.screen),
                                  );
                                },
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: e.image.contains('asset')
                                      ? Image.asset(
                                          e.image,
                                          width: 35,
                                          fit: BoxFit.fill,
                                        )
                                      : Image.network(e.image),
                                ),
                                title: Text(e.title),
                                subtitle: Text(e.description),
                                trailing:
                                    const Icon(Icons.keyboard_arrow_right)),
                          ),
                        ))
                    .toList(),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

List<UIModel> ui = [
  UIModel(
    title: 'Black Jack',
    description: 'Card user interface for black jack',
    image: "${uiImage}blackJack.png",
    screen: const BlackJack(),
  ),
  UIModel(
    title: 'Coffee UI',
    description: 'Beautiful coffee UI screen',
    image: "${uiImage}coffee.ui.png",
    screen: const CoffeeUI(),
  ),
];
