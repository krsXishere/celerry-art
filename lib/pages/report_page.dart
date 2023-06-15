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
  late int itemStock;
  late SelectionBehavior selectionBehavior;
  num pointIndex = 0;

  @override
  void initState() {
    reportStockData = getPieData();
    tooltipBehavior = TooltipBehavior(
      enable: true,
      textStyle: primaryTextStyle.copyWith(
        color: white,
      ),
    );
    tooltipProfit = TooltipBehavior(
      enable: true,
      textStyle: primaryTextStyle.copyWith(
        color: white,
      ),
    );
    selectionBehavior = SelectionBehavior(
      enable: true,
      selectedColor: primaryGreen,
    );
    itemStock = countItems();
    super.initState();
  }

  int countItems() {
    int item = reportStockData.length;
    return item;
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
                    onTooltipRender: (TooltipArgs args) {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        setState(() {
                          pointIndex = args.pointIndex!;
                        });
                      });

                      args.header = 'Bouqet Terjual';
                    },
                    onMarkerRender: (MarkerRenderArgs args) {
                      if (!(args.pointIndex == pointIndex)) {
                        args.markerHeight = 0;
                        args.markerWidth = 0;
                      }
                    },
                    margin: EdgeInsets.all(defaultPadding),
                    plotAreaBorderWidth: 0,
                    plotAreaBackgroundColor: Colors.transparent,
                    plotAreaBorderColor: Colors.transparent,
                    tooltipBehavior: tooltipProfit,
                    primaryXAxis: CategoryAxis(
                      minorTickLines: const MinorTickLines(size: 0),
                      labelPlacement: LabelPlacement.onTicks,
                      labelStyle: primaryTextStyle,
                      rangePadding: ChartRangePadding.round,
                    ),
                    primaryYAxis: NumericAxis(
                      isVisible: false,
                    ),
                    series: <ChartSeries>[
                      SplineAreaSeries<SalesData, String>(
                        selectionBehavior: selectionBehavior,
                        cardinalSplineTension: 0,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            secondaryGreen,
                            white,
                          ],
                        ),
                        // dataLabelSettings: DataLabelSettings(
                        //   // alignment: ChartAlignment.center
                        //   isVisible: true,
                        //   labelAlignment: ChartDataLabelAlignment.top,
                        //   color: secondaryGreen,
                        // ),
                        markerSettings: MarkerSettings(
                          isVisible: true,
                          shape: DataMarkerType.circle,
                          borderColor: white,
                          color: Colors.yellow,
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
                  padding: EdgeInsets.all(defaultPadding),
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
                      Text(
                        "Diagram Stok Barang",
                        style: primaryTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 80,
                            child: Column(
                              children: [
                                Text(
                                  "$itemStock",
                                  style:
                                      primaryTextStyle.copyWith(fontSize: 30),
                                ),
                                Text(
                                  "Bahan Baku",
                                  style: primaryTextStyle,
                                ),
                              ],
                            ),
                          ),
                          SfCircularChart(
                            margin: EdgeInsets.zero,
                            palette: [
                              primaryGreen,
                              secondaryGreen,
                              thirdColor,
                              creameColor,
                              redColor,
                            ],
                            tooltipBehavior: tooltipBehavior,
                            legend: Legend(
                              toggleSeriesVisibility: true,
                              position: LegendPosition.bottom,
                              isVisible: true,
                              textStyle: primaryTextStyle,
                              overflowMode: LegendItemOverflowMode.wrap,
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
