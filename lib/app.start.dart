import 'package:flutter/material.dart';
import 'package:flutter_fun/constants.dart';

import 'ui/ui.dart';
// import 'package:lottie/lottie.dart';

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
        const SizedBox(
          height: 30,
        ),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          spacing: 20,
          runSpacing: 15,
          crossAxisAlignment: WrapCrossAlignment.end,
          runAlignment: WrapAlignment.center,
          children: [
            ...features(context).map((Features e) => FeatureCard(feature: e))
          ],
        )
      ]),
    );
  }
}

class Features {
  final String name;
  final String description;
  final String image;
  final IconData icon;
  final VoidCallback onPress;
  const Features({
    required this.name,
    required this.description,
    required this.image,
    required this.icon,
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
      color: Colors.white,
      child: InkWell(
        onTap: feature.onPress,
        child: Container(
          width: size.width * 0.43,
          height: size.height * 0.2,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Icon(
                feature.icon,
                color: Colors.blueGrey.shade800,
                size: 50,
              )),
              // Expanded(
              //   child: Lottie.asset(
              //     feature.image,
              //   ),
              // ),
              const Divider(),
              Text(
                feature.name,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                feature.description,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Features> features(BuildContext cxt) => [
      Features(
        name: 'Games',
        description: 'Play games',
        image: '${gamesJson}game.json',
        onPress: () {},
        icon: Icons.games_outlined,
      ),
      Features(
        name: 'UI',
        description: 'Beautiful Screens',
        image: '${uiJson}ui.json',
        onPress: () {
          Navigator.push(
              cxt,
              MaterialPageRoute(
                builder: (_) => const UICards(),
              ));
        },
        icon: Icons.design_services,
      ),
      Features(
        name: 'State Management',
        description: 'All state managments',
        image: '${smJson}state.management.json',
        onPress: () {},
        icon: Icons.fiber_manual_record,
      ),
      Features(
        name: 'Test',
        description: 'Flutter Test',
        image: '${testJson}test.json',
        onPress: () {},
        icon: Icons.thermostat_auto,
      ),
      Features(
        name: 'Services',
        description: 'Using new tools',
        image: '${testJson}test.json',
        onPress: () {},
        icon: Icons.room_service,
      ),
    ];
