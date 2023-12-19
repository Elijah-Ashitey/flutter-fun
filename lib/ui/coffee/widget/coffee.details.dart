import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color.theme.dart';

class CoffeeDetils extends StatelessWidget {
  final String rating;
  final String name;
  final String subtitle;
  final String price;
  final String image;
  const CoffeeDetils({
    super.key,
    required this.rating,
    required this.name,
    required this.subtitle,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeColorTheme.bgColor,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(),
            child: Hero(
              tag: image,
              child: Image.asset(
                image,
                width: Get.size.width,
                height: Get.size.height * 0.5,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: CoffeeColorTheme.coffeeColor.withOpacity(0.3),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 1.0,
                  sigmaY: 1.0,
                ),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: CoffeeColorTheme.normalTextStyle.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              subtitle,
                              style: CoffeeColorTheme.normalTextStyle.copyWith(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: CoffeeColorTheme.pColor,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  rating,
                                  style:
                                      CoffeeColorTheme.normalTextStyle.copyWith(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  "(6.986)",
                                  style:
                                      CoffeeColorTheme.normalTextStyle.copyWith(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                CoffeElement(
                                  element: 'Coffee',
                                  icon: Icons.coffee,
                                ),
                                SizedBox(width: 30),
                                CoffeElement(
                                  element: 'Milk',
                                  icon: Icons.water_drop,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 16),
                              decoration: BoxDecoration(
                                color: CoffeeColorTheme.bgColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Text(
                                "Medium Roasted",
                                style:
                                    CoffeeColorTheme.normalTextStyle.copyWith(
                                  fontSize: 9,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              decoration: const BoxDecoration(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Description",
                      style: CoffeeColorTheme.normalTextStyle.copyWith(
                        fontSize: 16,
                        color: CoffeeColorTheme.greyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "A cappucciono is a coffee-based drink made primarily from expresso and milk ...Read More",
                      style: CoffeeColorTheme.normalTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Sizes",
                      style: CoffeeColorTheme.normalTextStyle.copyWith(
                        fontSize: 16,
                        color: CoffeeColorTheme.greyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...[
                            "S",
                            "M",
                            "L",
                          ]
                              .map((e) => Container(
                                    margin: const EdgeInsets.all(10),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 50),
                                    decoration: BoxDecoration(
                                        border: e == "S"
                                            ? Border.all(
                                                color: CoffeeColorTheme.pColor)
                                            : null,
                                        color: CoffeeColorTheme.lightBlueColor
                                            .withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      e,
                                      style: CoffeeColorTheme.normalTextStyle
                                          .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ))
                              .toList()
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "Price",
                              style: CoffeeColorTheme.normalTextStyle.copyWith(
                                fontSize: 16,
                                color: CoffeeColorTheme.greyColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: '\$', // default text style
                                style: GoogleFonts.lato(
                                  color: CoffeeColorTheme.pColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' $price',
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 30),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: CoffeeColorTheme.pColor,
                            ),
                            child: Center(
                              child: Text(
                                "Buy Now",
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
            ),
          )
        ],
      ),
    );
  }
}

class CoffeElement extends StatelessWidget {
  final IconData icon;
  final String element;
  const CoffeElement({
    super.key,
    required this.icon,
    required this.element,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7),
      decoration: BoxDecoration(
          color: CoffeeColorTheme.bgColor,
          borderRadius: BorderRadius.circular(7)),
      child: Column(
        children: [
          Icon(
            icon,
            color: CoffeeColorTheme.pColor,
          ),
          Text(
            element,
            style: CoffeeColorTheme.normalTextStyle.copyWith(
              fontSize: 9,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
