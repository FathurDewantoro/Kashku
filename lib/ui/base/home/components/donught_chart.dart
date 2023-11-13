import 'package:flutter/material.dart';
import 'package:kashku/utils/color.dart';
import 'package:kashku/utils/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../utils/screen.dart';
import '../home.dart';

class DonughtChartHome extends StatelessWidget {
  const DonughtChartHome({
    super.key,
    required this.chartData2,
    required this.chartData,
  });

  final List<ChartData> chartData2;
  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: displayWidth(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Text(
                "Saldo",
                style: TextBodyMedium(GRAY),
              ),
              const Text(
                "Rp 7.160.000",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.w700, color: BLACK),
              )
            ],
          ),
          SizedBox(
            width: displayWidth(context) * 0.75,
            child: SfCircularChart(series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                startAngle: (chartData2[0].y.toDouble() * 3.6).toInt() - 1,
                endAngle: 1,
                dataSource: chartData,
                innerRadius: '68%',
                radius: "95%",
                enableTooltip: true,
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(
                      color: WHITE, fontWeight: FontWeight.w600, fontSize: 15),
                ),
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelMapper: (ChartData data, _) => "${data.y}%",
              )
            ]),
          ),
          SizedBox(
            width: displayWidth(context),
            child: SfCircularChart(series: <CircularSeries>[
              DoughnutSeries<ChartData, String>(
                endAngle: (chartData2[0].y.toDouble() * 3.6).toInt(),
                dataSource: chartData2,
                radius: "99%",
                innerRadius: '61%',
                enableTooltip: true,
                dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(
                        color: WHITE,
                        fontWeight: FontWeight.w600,
                        fontSize: 15)),
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                dataLabelMapper: (ChartData data, _) => "${data.y}%",
              )
            ]),
          ),
        ],
      ),
    );
  }
}
