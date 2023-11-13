import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:intl/intl.dart';
import 'package:kashku/utils/color.dart';
import 'package:kashku/utils/custom_button.dart';
import 'package:kashku/utils/screen.dart';
import 'package:kashku/utils/styles.dart';

class TransaksiPage extends StatefulWidget {
  const TransaksiPage({super.key});

  @override
  State<TransaksiPage> createState() => _TransaksiPageState();
}

class _TransaksiPageState extends State<TransaksiPage> {
  bool buttonPengeluaran = true;
  List<DateTime> dates = [];
  DateTime now = DateTime.now();
  int _indexSelectedDay = 0;
  DateTime startOfWeek =
      DateTime.now().subtract(Duration(days: DateTime.now().weekday - 1));
  List<String> hari = [
    'Sen',
    'Sel',
    'Rab',
    'Kam',
    'Jum',
    'Sab',
    "Min",
  ];

  void switchButton() {
    setState(() {
      if (buttonPengeluaran) {
        buttonPengeluaran = false;
      } else {
        buttonPengeluaran = true;
      }
    });
  }

  List<DateTime> generateWeeklyDates(DateTime startDate) {
    dates.clear();
    for (int i = 0; i < 7; i++) {
      if (startDate.add(Duration(days: i)) == now) {
        setState(() {
          _indexSelectedDay = i;
        });
      }
      dates.add(startDate.add(Duration(days: i)));
    }
    return dates;
  }

  void increaseDay() {
    setState(() {
      startOfWeek = startOfWeek.add(Duration(days: 7));
      generateWeeklyDates(startOfWeek);
    });
  }

  void decreaseDay() {
    setState(() {
      startOfWeek = startOfWeek.subtract(Duration(days: 7));
      generateWeeklyDates(startOfWeek);
    });
  }

  @override
  void initState() {
    DateTime startOfWeekInit = now.subtract(Duration(days: now.weekday - 1));
    generateWeeklyDates(startOfWeekInit);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WHITE,
      appBar: AppBar(
        title: Text(
          'Transaksi',
          style: TextTitleMedium(BLACK),
        ),
        backgroundColor: WHITE,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            width: displayWidth(context),
            decoration: decorationBorder(10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyElevatedButton(
                    onPressed: () {
                      switchButton();
                    },
                    height: 52,
                    color: buttonPengeluaran ? SECONDARY : WHITE,
                    width: displayWidth(context) * 0.435,
                    borderRadius: BorderRadius.circular(8),
                    child: Text(
                      'Pengeluaran',
                      style:
                          TextButtonCustom(buttonPengeluaran ? WHITE : BLACK),
                    ),
                  ),
                  MyElevatedButton(
                    onPressed: () {
                      switchButton();
                    },
                    height: 52,
                    color: buttonPengeluaran ? WHITE : PRIMARY,
                    width: displayWidth(context) * 0.435,
                    borderRadius: BorderRadius.circular(8),
                    child: Text(
                      'Pemasukan',
                      style:
                          TextButtonCustom(buttonPengeluaran ? BLACK : WHITE),
                    ),
                  ),
                ]),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 180,
            width: displayWidth(context),
            padding: EdgeInsets.all(20),
            decoration: decorationBorder(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          IconlyLight.calendar,
                          color: buttonPengeluaran ? SECONDARY : PRIMARY,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          DateFormat('MMM yyyy').format(startOfWeek),
                          style: TextTitleSmall(BLACK),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 20,
                          child: IconButton(
                            onPressed: () {
                              decreaseDay();
                            },
                            icon: Icon(Icons.arrow_back_ios_new_rounded),
                            iconSize: 17,
                            color: GRAY,
                            padding: EdgeInsets.all(0),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            increaseDay();
                          },
                          icon: Icon(Icons.arrow_forward_ios_rounded),
                          iconSize: 17,
                          color: GRAY,
                          padding: EdgeInsets.all(0),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      if (index == _indexSelectedDay) {
                        return Container(
                          margin: EdgeInsets.only(right: 8),
                          width: ScreenUtils.getWidth(context) * 0.095,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color:
                                      buttonPengeluaran ? SECONDARY : PRIMARY),
                              color: buttonPengeluaran
                                  ? BACKGROUND_SECONDARY
                                  : BACKGROUND_PRIMARY),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                hari[index],
                                style: TextBodySmall(
                                    buttonPengeluaran ? SECONDARY : PRIMARY),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(DateFormat('dd').format(dates[index]),
                                  style: TextTitleLarge(
                                      buttonPengeluaran ? SECONDARY : PRIMARY)),
                            ],
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _indexSelectedDay = index;
                              print(dates[_indexSelectedDay]);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            width: ScreenUtils.getWidth(context) * 0.095,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  hari[index],
                                  style: TextBodySmall(GRAY),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  DateFormat('dd').format(dates[index]),
                                  style: TextTitleLarge(BLACK),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
