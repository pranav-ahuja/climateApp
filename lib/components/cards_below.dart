import 'package:flutter/material.dart';
import 'package:climate_app/components/icon_used.dart';

class CardsBelow extends StatelessWidget {
  CardsBelow(
      {required this.label,
      required this.unit,
      this.value,
      required this.iconsBelow});

  final String label;
  final int? value;
  final String unit;
  final Icon iconsBelow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconsWidgets(
            iconLogo: iconsBelow,
            sizeOfIcon: 50,
            colorOfIcon: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              Text(
                "$value $unit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
