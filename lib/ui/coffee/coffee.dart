import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants.dart';
import 'utils/color.theme.dart';
import 'widget/coffee.card.dart';
import 'widget/tabs.dart';

class CoffeeUI extends StatefulWidget {
  const CoffeeUI({super.key});

  @override
  State<CoffeeUI> createState() => _CoffeeUIState();
}

class _CoffeeUIState extends State<CoffeeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CoffeeColorTheme.bgColor,
      ),
      backgroundColor: CoffeeColorTheme.bgColor,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: CoffeeColorTheme.greyColor,
        selectedItemColor: CoffeeColorTheme.pColor,
        backgroundColor: CoffeeColorTheme.bgColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.shopping_bag_rounded),
          //   label: '',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Find the best coffee for you",
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 40,
              ),
            ),
            // search bar
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 5,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CoffeeColorTheme.lightBlueColor.withOpacity(0.1),
              ),
              child: TextFormField(
                style: GoogleFonts.montserrat(
                  color: CoffeeColorTheme.lightBlueColor.withOpacity(0.5),
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    FeatherIcons.search,
                    color: CoffeeColorTheme.lightBlueColor.withOpacity(0.5),
                  ),
                  hintStyle: GoogleFonts.montserrat(
                    color: CoffeeColorTheme.lightBlueColor.withOpacity(0.5),
                  ),
                  hintText: 'Find Your Coffee...',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                ...coffeeTypes.map((e) => CoffesTypesTabs(
                      type: e,
                      active: e == 'Cappuccino',
                    ))
              ]),
            ),
            const SizedBox(height: 20),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              runAlignment: WrapAlignment.spaceBetween,
              children: [
                ...coffee
                    .map((e) => CoffeeCard(
                        rating: e["rating"],
                        name: e['name'],
                        subtitle: e['subtitle'],
                        price: e['price'],
                        image: e['image']))
                    .toList(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<String> coffeeTypes = [
  'Cappuccino',
  'Expresso',
  'Latte',
  'Flat Water',
];

List coffee = [
  {
    "rating": "4.5",
    "name": "Cappuccino",
    "subtitle": "With Oat Milk",
    "price": "4.20",
    "image": "${uiImage}coffee2.jpg",
  },
  {
    "rating": "4.2",
    "name": "Cappuccino",
    "subtitle": "With Chocolate",
    "price": "3.14",
    "image": "${uiImage}coffee4.jpg",
  }
];
