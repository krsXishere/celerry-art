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
    // SalesData("Des", 20),
    SalesData("Jan", 20),
    SalesData("Feb", 25),
    SalesData("Mar", 22),
    SalesData("Jun", 21),
    SalesData("Jul", 30),
    SalesData("Agu", 28),
    SalesData("Sep", 30),
    SalesData("Okt", 27),
    SalesData("Nov", 18),
    SalesData("Des", 20),
  ];

  return columnData;
}
