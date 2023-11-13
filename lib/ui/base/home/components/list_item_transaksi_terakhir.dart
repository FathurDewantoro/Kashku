import 'package:flutter/material.dart';
import 'package:kashku/utils/color.dart';
import 'package:kashku/utils/styles.dart';

class ListItemTransaksiTerakhir extends StatelessWidget {
  ListItemTransaksiTerakhir(
      {super.key,
      required this.colorMoney,
      required this.icon,
      required this.money,
      required this.subtitle,
      required this.title});

  Container icon;
  String title;
  String subtitle;
  String money;
  Color colorMoney;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextTitleSmall(BLACK),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    subtitle,
                    style: TextBodySmall(GRAY),
                  )
                ],
              )
            ],
          ),
          Text(
            money,
            style: TextBodyMedium(colorMoney),
          )
        ],
      ),
    );
  }
}
