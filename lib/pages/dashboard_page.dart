import 'package:celerry_art/common/theme.dart';
import 'package:celerry_art/pages/bouqet_page.dart';
import 'package:celerry_art/pages/inventory_in_page.dart';
import 'package:celerry_art/pages/sale_page.dart';
import 'package:celerry_art/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:page_transition/page_transition.dart';

import '../data/report_profit_data.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late TooltipBehavior tooltipProfit;

  @override
  void initState() {
    tooltipProfit = TooltipBehavior(
      enable: true,
      textStyle: primaryTextStyle.copyWith(
        color: white,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        titleSpacing: 20,
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
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const SplashScreen(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                "assets/svg/celerry-icon-1.svg",
              ),
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
                                fontSize: 25,
                                color: white,
                              ),
                            ),
                            Text(
                              "Total Penjualan",
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 15,
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
                                fontSize: 25,
                                color: white,
                              ),
                            ),
                            Text(
                              "Total Pembelian",
                              style: primaryTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 15,
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
                                fontSize: 15,
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: const InventoryInPage(),
                              type: PageTransitionType.rightToLeft),
                        );
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/svg/gudang-masuk.svg"),
                          Text(
                            "Masuk",
                            style: primaryTextStyle.copyWith(),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: const SalePage(),
                              type: PageTransitionType.rightToLeft),
                        );
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/svg/penjualan.svg"),
                          Text(
                            "Penjualan",
                            style: primaryTextStyle.copyWith(),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                              child: const BouqetPage(),
                              type: PageTransitionType.rightToLeft),
                        );
                      },
                      child: Column(
                        children: [
                          SvgPicture.asset("assets/svg/bouqet.svg"),
                          Text(
                            "Paket Bouqet",
                            style: primaryTextStyle.copyWith(),
                          ),
                        ],
                      ),
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
                    onTooltipRender: (TooltipArgs args) {
                      args.header = "Bouqet Terjual";
                    },
                    tooltipBehavior: tooltipProfit,
                    primaryXAxis: CategoryAxis(),
                    primaryYAxis: NumericAxis(),
                    series: <ChartSeries>[
                      SplineAreaSeries<SalesData, String>(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            secondaryGreen,
                            white,
                          ],
                        ),
                        enableTooltip: true,
                        borderWidth: 5,
                        splineType: SplineType.clamped,
                        borderColor: primaryGreen,
                        color: secondaryGreen,
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
