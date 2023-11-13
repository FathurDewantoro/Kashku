import 'package:flutter/material.dart';
import 'package:kashku/utils/color.dart';
import 'package:kashku/utils/screen.dart';
import 'package:kashku/utils/styles.dart';
class CardTotalHome extends StatelessWidget {
  CardTotalHome(
      {super.key,
      required this.colorPrimary,
      required this.colorSecondary,
      required this.icon,
      required this.percentage,
      required this.percentageIcon,
      required this.title,
      required this.valueMoney,
      this.arah});

  Color colorPrimary;
  Color colorSecondary;
  IconData icon;
  String title;
  String valueMoney;
  int percentage;
  IconData percentageIcon;
  int? arah;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.43,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          color: colorSecondary, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: colorPrimary, borderRadius: BorderRadius.circular(50)),
            child: Icon(
              icon,
              color: WHITE,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextBodySmall(GRAY),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            valueMoney,
            style: TextHeadingSmall(BLACK),
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text(
                "${percentage}%",
                style: TextTitleSmall(BLACK),
              ),
              RotatedBox(
                quarterTurns: arah ?? 0,
                child: Icon(
                  percentageIcon,
                  color: colorPrimary,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
