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
    SalesData("Sep", 34),
    SalesData("Okt", 34),
    SalesData("Nov", 34),
    SalesData("Des", 34),
  ];

  return columnData;
}