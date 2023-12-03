import 'package:flutter/material.dart';
import 'package:flutter_fun/ui/cards/cards.dart';

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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const BlackJack(),
                            ),
                          );
                        },
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 4),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                              "https://source.unsplash.com/user/c_v_r/100x100"),
                        ),
                        title: const Text("Black Jack"),
                        subtitle:
                            const Text("Card user interface for black jack"),
                        trailing: const Icon(Icons.keyboard_arrow_right)),
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
