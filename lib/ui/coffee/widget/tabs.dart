import 'package:flutter/material.dart';
import 'package:flutter_fun/ui/coffee/utils/color.theme.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffesTypesTabs extends StatefulWidget {
  final String type;
  final bool active;

  const CoffesTypesTabs({super.key, required this.type, this.active = false});

  @override
  State<CoffesTypesTabs> createState() => _CoffesTypesTabsState();
}

class _CoffesTypesTabsState extends State<CoffesTypesTabs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Text(
            widget.type,
            style: GoogleFonts.montserrat(
              color: widget.active
                  ? CoffeeColorTheme.pColor
                  : CoffeeColorTheme.greyColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          if (widget.active) ...{
            const SizedBox(height: 5),
            const CircleAvatar(
              radius: 5,
            ),
          }
        ],
      ),
    );
  }
}
