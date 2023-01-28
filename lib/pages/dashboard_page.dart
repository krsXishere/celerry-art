import 'package:celerry_art/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        title: Text(
          "CELERRY.art",
          style: primaryTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              "assets/svg/celerry-icon-1.svg",
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(defaultBorderRadius),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: secondaryGreen,
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "20",
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 20,
                                color: white,
                              ),
                            ),
                            Text(
                              "Total Penjualan",
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: secondaryGreen,
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "20",
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 20,
                                color: white,
                              ),
                            ),
                            Text(
                              "Total Pembelian",
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: secondaryGreen,
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "20",
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 20,
                                color: white,
                              ),
                            ),
                            Text(
                              "Total Pemakaian",
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                color: white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "Menu",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset("assets/svg/gudang-masuk.svg"),
                        Text(
                          "Masuk",
                          style: primaryTextStyle.copyWith(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset("assets/svg/gudang-keluar.svg"),
                        Text(
                          "Keluar",
                          style: primaryTextStyle.copyWith(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset("assets/svg/paket-bouqet.svg"),
                        Text(
                          "Paket Bouqet",
                          style: primaryTextStyle.copyWith(),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "Grafik Pendapatan",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(defaultBorderRadius),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: grey.withOpacity(0.3),
                      ),
                    ],
                  ),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    series: <ChartSeries>[
                      ColumnSeries<SalesData, String>(
                        color: secondaryGreen,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                        dataSource: getColumnData(),
                        xValueMapper: (SalesData sales, _) => sales.x,
                        yValueMapper: (SalesData sales, _) => sales.y,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  String x;
  double y;

  SalesData(
    this.x,
    this.y,
  );
}

dynamic getColumnData() {
  List<SalesData> columnData = <SalesData>[
    SalesData("Jan", 20),
    SalesData("Feb", 25),
    SalesData("Mar", 22),
    SalesData("Jun", 21),
    SalesData("Jul", 30),
    SalesData("Agu", 34),
  ];

  return columnData;
}