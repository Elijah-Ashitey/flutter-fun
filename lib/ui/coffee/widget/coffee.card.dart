import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color.theme.dart';

class CoffeeCard extends StatelessWidget {
  final String rating;
  final String name;
  final String subtitle;
  final String price;
  final String image;

  const CoffeeCard(
      {super.key,
      required this.rating,
      required this.name,
      required this.subtitle,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width * 0.42,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: CoffeeColorTheme.lightBlueColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 150,
              width: Get.size.width * 0.4,
              decoration: const BoxDecoration(),
              child: Stack(children: [
                Image.asset(
                  image,
                  width: Get.size.width * 0.4,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          color: CoffeeColorTheme.bgColor.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star,
                            color: CoffeeColorTheme.pColor,
                            size: 12,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            rating,
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )),
                )
              ]),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: GoogleFonts.montserrat(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.montserrat(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: '\$', // default text style
                  style: GoogleFonts.lato(
                    color: CoffeeColorTheme.lightPColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  children: [
                    TextSpan(
                      text: ' $price',
                      style: GoogleFonts.lato(
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
      ),
    );
  }
}
