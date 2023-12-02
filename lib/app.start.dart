import 'package:flutter/material.dart';
import 'package:flutter_fun/constants.dart';

class AppStart extends StatelessWidget {
  const AppStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(children: [
        const ListTile(
          title: Text(
            'Flutter Hub',
            style: TextStyle(color: Colors.blueGrey, fontSize: 30),
          ),
          subtitle: Text(
            'Coding for fun',
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          trailing: Stack(
            children: [
              Icon(Icons.notifications, size: 30, color: Colors.blueGrey),
              Positioned(
                top: 0,
                right: 0,
                child: Icon(Icons.circle, size: 12, color: Colors.red),
              ),
            ],
          ),
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 8,
          crossAxisAlignment: WrapCrossAlignment.end,
          runAlignment: WrapAlignment.center,
          children: [...features.map((Features e) => FeatureCard(feature: e))],
        )
      ]),
    );
  }
}

class Features {
  final String name;
  final String description;
  final String image;
  final VoidCallback onPress;
  const Features({
    required this.name,
    required this.description,
    required this.image,
    required this.onPress,
  });
}

class FeatureCard extends StatelessWidget {
  final Features feature;
  const FeatureCard({Key? key, required this.feature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: InkWell(
        onTap: feature.onPress,
        child: Container(
          width: size.width * 0.43,
          height: size.height * 0.2,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(),
          child: Column(
            children: [
              // Image.asset(feature.image),
              Text(feature.name),
              Text(feature.description),
            ],
          ),
        ),
      ),
    );
  }
}

List<Features> features = [
  Features(
    name: 'Games',
    description: 'Play games',
    image: '${gamesJson}game.json',
    onPress: () {},
  ),
  Features(
    name: 'UI',
    description: 'Beautiful Screens',
    image: '${uiJson}ui.json',
    onPress: () {},
  ),
  Features(
    name: 'State Management',
    description: 'All state managments',
    image: '${smJson}state.management.json',
    onPress: () {},
  ),
  Features(
    name: 'Test',
    description: 'Flutter Test',
    image: '${testJson}test.json',
    onPress: () {},
  ),
  Features(
    name: 'Services',
    description: 'Using new tools',
    image: '${servicesJson}services.json',
    onPress: () {},
  ),
];
