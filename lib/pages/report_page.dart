import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../common/theme.dart';
import '../data/report_profit_data.dart';
import '../data/report_stock_data.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late List<ReportStockData> reportStockData;
  late TooltipBehavior tooltipBehavior;
  late TooltipBehavior tooltipProfit;

  @override
  void initState() {
    reportStockData = getPieData();
    tooltipBehavior = TooltipBehavior(enable: true);
    tooltipProfit = TooltipBehavior(enable: true);
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
                Text(
                  "Jumlah Penjualan",
                  style: primaryTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
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
                    margin: EdgeInsets.all(defaultPadding),
                    plotAreaBorderWidth: 0,
                    plotAreaBackgroundColor: Colors.transparent,
                    plotAreaBorderColor: Colors.transparent,
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
                        borderWidth: 5,
                        enableTooltip: true,
                        splineType: SplineType.clamped,
                        borderColor: primaryGreen,
                        isVisible: true,
                        color: secondaryGreen,
                        dataSource: getColumnData(),
                        xValueMapper: (SalesData sales, _) => sales.x,
                        yValueMapper: (SalesData sales, _) => sales.y,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Text(
                          "Diagram Stok Barang",
                          style: primaryTextStyle.copyWith(
                            fontSize: 20,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                      Stack(
                        children: [
                          Positioned(
                            left: 75,
                            top: 120,
                            child: Column(
                              children: [
                                Text(
                                  "2",
                                  style:
                                      primaryTextStyle.copyWith(fontSize: 18),
                                ),
                                Text(
                                  "Bahan Baku",
                                  style: primaryTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SfCircularChart(
                            palette: [
                              primaryGreen,
                              secondaryGreen,
                              thirdColor,
                              creameColor,
                              redColor,
                            ],
                            tooltipBehavior: tooltipBehavior,
                            legend: Legend(
                              isVisible: true,
                              textStyle: primaryTextStyle,
                              overflowMode: LegendItemOverflowMode.wrap,
                              alignment: ChartAlignment.center,
                              isResponsive: true,
                              orientation: LegendItemOrientation.vertical,
                            ),
                            series: <CircularSeries>[
                              DoughnutSeries<ReportStockData, String>(
                                enableTooltip: true,
                                explode: true,
                                explodeIndex: 0,
                                dataSource: reportStockData,
                                xValueMapper: (ReportStockData data, _) =>
                                    data.xData,
                                yValueMapper: (ReportStockData data, _) =>
                                    data.yData,
                                dataLabelMapper: (ReportStockData data, _) =>
                                    data.text,
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  textStyle: primaryTextStyle.copyWith(
                                    color: white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
