class ReportStockData {
  ReportStockData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String? text;
}

dynamic getPieData() {
  List<ReportStockData> getPieData = <ReportStockData>[
    ReportStockData("Kertas Sage", 20),
    ReportStockData("Silverqueen", 25),
    ReportStockData("Lem", 22),
  ];

  return getPieData;
}
