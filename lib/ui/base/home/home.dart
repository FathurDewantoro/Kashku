import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kashku/utils/color.dart';
import 'package:kashku/utils/determineTime.dart';
import 'package:kashku/utils/icon_kategori.dart';
import 'package:kashku/utils/styles.dart';

import 'components/card_total_home.dart';
import 'components/donught_chart.dart';
import 'components/list_item_transaksi_terakhir.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> item = <String>['Bulan ini', 'Bulan lalu', '3 Bulan'];
  String? selectedValue;
  String hari = "Siang 🌤";

  late List<ChartData> chartData;
  late List<ChartData> chartData2;

  @override
  void initState() {
    chartData = [
      ChartData(PRIMARY, 'Steve', 64),
    ];
    chartData2 = [
      ChartData(SECONDARY, 'David', 36),
    ];

    super.initState();
    hari = determineTimeOfDay(DateTime.now());

    _scrollController.addListener(() {
      if (_scrollController.offset <= 65) {
        setState(() {
          _isAppBarVisible = false;
        });
      } else {
        setState(() {
          _isAppBarVisible = true;
        });
      }
    });
  }

  ScrollController _scrollController = ScrollController();
  bool _isAppBarVisible = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: WHITE,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.all(0),
                title: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/images/logo/kashku_logo_splash.png'))),
                ),
                centerTitle: true,
              ),
              backgroundColor: WHITE,
              elevation: 1,
              toolbarHeight: _isAppBarVisible ? 50 : 0,
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                  left: 20, right: 20, top: _isAppBarVisible ? 0 : 35),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                            radius: 26),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Selamat $hari",
                                style: TextBodyMedium(GRAY)),
                            Text("Fathur Dewantoro",
                                style: TextTitleLarge(BLACK)),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {}, icon: const Icon(IconlyLight.filter))
                  ],
                ),
                SizedBox(
                  height: _isAppBarVisible ? 15 : 30,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: decorationBorder(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Saldo Tersedia",
                            style: TextBodyLarge(GRAY),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Rp 7.160.000",
                            style: TextHeadLineSmall(BLACK),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            '3.15%',
                            style: TextBodySmall(PRIMARY),
                          ),
                          const Icon(
                            Icons.arrow_drop_up_rounded,
                            color: PRIMARY,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breakdown",
                      style: TextHeadLineSmall(BLACK),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text(
                          'Bulan ini',
                          style: TextTitleSmall(BLACK),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: item
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: TextTitleSmall(BLACK),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 35,
                          width: 120,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: decorationBorder(10),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          width: 200,
                          decoration: decorationBorder(10),
                          scrollbarTheme: ScrollbarThemeData(
                            radius: const Radius.circular(40),
                            thickness: MaterialStateProperty.all(6),
                            thumbVisibility: MaterialStateProperty.all(true),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                          padding: EdgeInsets.only(left: 14, right: 14),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                DonughtChartHome(chartData2: chartData2, chartData: chartData),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardTotalHome(
                        colorPrimary: PRIMARY,
                        colorSecondary: BACKGROUND_PRIMARY,
                        icon: Icons.auto_graph,
                        percentage: 12,
                        percentageIcon: Icons.moving,
                        title: "Total Penghematan",
                        valueMoney: "Rp 5.435.000"),
                    CardTotalHome(
                      colorPrimary: SECONDARY,
                      colorSecondary: BACKGROUND_SECONDARY,
                      icon: Icons.query_stats,
                      percentage: 7,
                      percentageIcon: Icons.moving,
                      title: "Total Pengeluaran",
                      valueMoney: "Rp 1.730.000",
                      arah: 2,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Transaksi Terakhir",
                  style: TextHeadLineSmall(BLACK),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListItemTransaksiTerakhir(
                  colorMoney: SECONDARY,
                  icon: IconTransportasi(),
                  money: "- Rp 35.000",
                  title: "Transportasi ke Kantor",
                  subtitle: "11 November 2023",
                ),
                ListItemTransaksiTerakhir(
                  colorMoney: PRIMARY,
                  icon: IconPemasukan(),
                  money: "+ Rp 4.600.000",
                  title: "Tambah Saldo dari Gaji",
                  subtitle: "11 November 2023",
                ),
                ListItemTransaksiTerakhir(
                  colorMoney: PRIMARY,
                  icon: IconKebutuhanPokok(),
                  money: "- Rp 22.000",
                  title: "Makan Siang",
                  subtitle: "10 November 2023",
                ),
              ])),
            )
          ],
          // child: ListView(
          //   physics: BouncingScrollPhysics(),
          //   padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          //   children: [

          //   ],
          // ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.color, this.x, this.y);
  final Color color;
  final String x;
  final int y;
}
