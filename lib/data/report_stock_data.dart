class ReportStockData {
  ReportStockData(
    this.xData,
    this.yData, [
    this.text,
  ]);
  final String xData;
  final num yData;
  final String? text;
}

// dynamic getPieData(int? harga) {
//   List<ReportStockData> getPieData = <ReportStockData>[
//     ReportStockData("Kertas Sage Rp$harga", 20),
//     ReportStockData("Silverqueen Rp$harga", 25),
//     ReportStockData("Lem Rp$harga", 22),
//   ];

//   return getPieData;
// }

dynamic getPieData() {
  List<ReportStockData> getPieData = <ReportStockData>[
    ReportStockData("Kertas Sage", 20),
    ReportStockData("Silverqueen", 25),
    ReportStockData("Lem", 22),
  ];

  return getPieData;
}
