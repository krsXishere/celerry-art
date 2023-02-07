import 'dart:developer';

import 'package:celerry_art/pages/insert_bouqet_page.dart';
import 'package:celerry_art/pages/insert_custom_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:page_transition/page_transition.dart';

import '../common/theme.dart';

class CheckOutCustomPage extends StatefulWidget {
  final int hargaBouqet;
  const CheckOutCustomPage({
    super.key,
    required this.hargaBouqet,
  });

  @override
  State<CheckOutCustomPage> createState() => _CheckOutCustomPageState();
}

class _CheckOutCustomPageState extends State<CheckOutCustomPage> {
  int summaryItems = 0;
  bool isSelectedAll = false;
  List<TextEditingController>? quantityController = [];
  List<Map<String, dynamic>> selectedItems = [];
  List<Map<String, dynamic>> stateItemAll = [];
  List<Map<String, dynamic>> data = [
    {
      'id': 1,
      'title': 'Bunga imitasi',
      'stok': 30,
      'harga': 3000,
      'image': const FlutterLogo(),
      'jumlah': 1,
      'value': false,
    },
    {
      'id': 2,
      'title': 'Kertas sage',
      'stok': 20,
      'harga': 3000,
      'image': const FlutterLogo(),
      'jumlah': 1,
      'value': false,
    },
    {
      'id': 3,
      'title': 'Silverqueen',
      'stok': 13,
      'harga': 30000,
      'image': const FlutterLogo(),
      'jumlah': 1,
      'value': false,
    },
    {
      'id': 4,
      'title': 'Bunga hybrid',
      'stok': 13,
      'harga': 30000,
      'image': const FlutterLogo(),
      'jumlah': 1,
      'value': false,
    },
    {
      'id': 5,
      'title': 'Uang 100k',
      'stok': 13,
      'harga': 30000,
      'image': const FlutterLogo(),
      'jumlah': 1,
      'value': false,
    },
    {
      'id': 6,
      'title': 'Uang 50k',
      'stok': 13,
      'harga': 30000,
      'image': const FlutterLogo(),
      'jumlah': 1,
      'value': false,
    },
    {
      'id': 7,
      'title': 'Uang 20k',
      'stok': 9,
      'harga': 30000,
      'image': const FlutterLogo(),
      'jumlah': 1,
      'value': false,
    },
  ];

  String formatCurrency(var currency) {
    final initialData = NumberFormat("#,##0", "id");
    String currentData = initialData.format(currency);
    return currentData;
  }

  void onSelectedItems(
    bool selected,
    int id,
    String title,
    int stok,
    int harga,
    int jumlah,
    Widget image,
    bool value,
  ) {
    if (selected == true) {
      setState(() {
        selectedItems.add({
          'id': id,
          'title': title,
          'stok': stok,
          'harga': harga,
          'jumlah': jumlah,
          'image': image,
          'value': value,
        });
      });
    } else if (selected == false) {
      setState(() {
        selectedItems.removeWhere(
          (element) => element['id'] == id,
        );
      });
    } else if (jumlah == 0) {
      setState(() {
        selectedItems.removeWhere(
          (element) => element['id'] == id,
        );
      });
    }
  }

  @override
  void initState() {
    // showModal();
    super.initState();
  }

  void alertNoItemSelected(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: AlignmentDirectional.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              defaultBorderRadius,
            ),
          ),
          title: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.yellow,
            child: Icon(
              Icons.warning_amber_rounded,
              color: white,
            ),
          ),
          content: Text(
            message,
            style: primaryTextStyle.copyWith(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: white,
                  side: BorderSide(color: primaryGreen),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      defaultBorderRadius,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Oke",
                  style: primaryTextStyle.copyWith(
                    color: primaryGreen,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void alertSuccess() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          alignment: AlignmentDirectional.center,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              defaultBorderRadius,
            ),
          ),
          title: SvgPicture.asset("assets/svg/success.svg"),
          content: Text(
            "Transaksi Berhasil",
            style: primaryTextStyle.copyWith(
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              width: 100,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0.0,
                  backgroundColor: white,
                  side: BorderSide(color: primaryGreen),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      defaultBorderRadius,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  "Oke",
                  style: primaryTextStyle.copyWith(
                    color: primaryGreen,
                    fontWeight: bold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void showModal() {
    showBarModalBottomSheet(
      backgroundColor: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            defaultBorderRadius,
          ),
        ),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 1,
              minChildSize: 1,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return selectedItems.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          controller: scrollController,
                          child: Column(
                            children: [
                              ListView.builder(
                                controller: scrollController,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: selectedItems.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  quantityController!.add(TextEditingController(
                                      text:
                                          '${selectedItems[index]['quantity']}'));
                                  // int quantity = int.parse(
                                  //     quantityController![index].text);

                                  return Padding(
                                    padding:
                                        EdgeInsets.only(bottom: defaultPadding),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            padding:
                                                EdgeInsets.all(defaultPadding),
                                            decoration: BoxDecoration(
                                              color: secondaryGreen,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      defaultBorderRadius),
                                            ),
                                            child: const FlutterLogo(
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: ListTile(
                                            title: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  selectedItems[index]['title'],
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    fontSize: 20,
                                                    fontWeight: medium,
                                                  ),
                                                ),
                                                Text(
                                                  "Jumlah: ${selectedItems[index]['jumlah'].toString()}",
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                Text(
                                                  "Rp${formatCurrency(selectedItems[index]['harga'])}",
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Divider(
                                thickness: 2,
                                color: grey.withOpacity(0.3),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Harga jual",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: defaultPadding,
                                      ),
                                      Text(
                                        "Subtotal item",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Rp${formatCurrency(widget.hargaBouqet)}",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: defaultPadding,
                                      ),
                                      Text(
                                        "Rp${formatCurrency(summaryItems)}",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 18,
                                          fontWeight: bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2,
                                color: grey.withOpacity(0.3),
                              ),
                              SizedBox(
                                height: defaultPadding,
                              ),
                              SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    backgroundColor: creameColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        defaultBorderRadius,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    alertSuccess();
                                  },
                                  child: Text(
                                    "Buat Pesanan",
                                    style: primaryTextStyle.copyWith(
                                      color: white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.yellow,
                            child: Icon(
                              Icons.warning_amber_rounded,
                              color: white,
                            ),
                          ),
                          SizedBox(
                            height: defaultPadding,
                          ),
                          Text(
                            "Pilih item dulu yah!",
                            style: primaryTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: bold,
                            ),
                          ),
                        ],
                      );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pilih Bahan",
                      style: primaryTextStyle.copyWith(
                        fontSize: 20,
                        fontWeight: semiBold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const InsertCustomItemPage(),
                            type: PageTransitionType.rightToLeft,
                          ),
                        );
                      },
                      child: Text(
                        "Tambah Bahan Custom",
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          color: grey,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    quantityController!.add(TextEditingController(text: '1'));
                    int quantity = int.parse(quantityController![index].text);

                    return Padding(
                      padding: EdgeInsets.only(bottom: defaultPadding),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.all(defaultPadding),
                              decoration: BoxDecoration(
                                color: secondaryGreen,
                                borderRadius:
                                    BorderRadius.circular(defaultBorderRadius),
                              ),
                              child: const FlutterLogo(
                                size: 40,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 7,
                            child: CheckboxListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(defaultBorderRadius),
                              ),
                              checkColor: white,
                              activeColor: secondaryGreen,
                              isThreeLine: true,
                              title: Text(
                                data[index]['title'],
                                style: primaryTextStyle.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Stok ${data[index]['stok']}",
                                        style: primaryTextStyle.copyWith(
                                          fontWeight: regular,
                                          color: data[index]['stok'] <= 10
                                              ? Colors.red
                                              : grey,
                                        ),
                                      ),
                                      SizedBox(
                                        width: defaultPadding,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (quantity >= 2) {
                                            setState(() {
                                              quantity = quantity - 1;
                                              quantityController![index].text =
                                                  quantity.toString();
                                            });
                                          }
                                        },
                                        child: Text(
                                          "-",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        width: 30,
                                        child: TextFormField(
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          cursorColor: secondaryGreen,
                                          controller:
                                              quantityController?[index],
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.all(0),
                                            filled: false,
                                            border: InputBorder.none,
                                            hintText: "$quantity",
                                            hintStyle:
                                                primaryTextStyle.copyWith(
                                              fontWeight: regular,
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            if (quantity != 0 &&
                                                quantityController?[index]
                                                        .text !=
                                                    "") {
                                              setState(() {
                                                quantity = int.parse(value);
                                                quantityController?[index]
                                                    .value
                                                    .copyWith(
                                                      text: value,
                                                      selection: TextSelection(
                                                        baseOffset:
                                                            value.length,
                                                        extentOffset:
                                                            value.length,
                                                      ),
                                                    );
                                              });
                                            }
                                          },
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            quantity = quantity + 1;
                                            quantityController![index].text =
                                                quantity.toString();
                                          });
                                        },
                                        child: Text(
                                          "+",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Rp${formatCurrency(data[index]['harga'])}",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              value: data[index]['value'],
                              onChanged: (value) {
                                if (quantity != 0 &&
                                    quantity <= data[index]['stok']) {
                                  setState(() {
                                    data[index]['value'] = value!;
                                  });

                                  onSelectedItems(
                                    value!,
                                    data[index]['id'],
                                    data[index]['title'],
                                    data[index]['stok'],
                                    data[index]['harga'],
                                    quantity,
                                    data[index]['image'],
                                    data[index]['value'],
                                  );

                                  summaryItems = selectedItems.isEmpty
                                      ? 0
                                      : selectedItems
                                          .map((e) => e['harga'] * e['jumlah'])
                                          .reduce((value, element) =>
                                              value + element);
                                } else if (quantity >= data[index]['stok']) {
                                  alertNoItemSelected(
                                      "Yah... Stoknya kurang nih!");
                                } else if (quantity == 0 ||
                                    quantityController?[index].text == '0') {
                                  alertNoItemSelected(
                                      "Upss... Masukin jumlah dulu yah!");
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(defaultPadding),
        height: 80,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(defaultBorderRadius),
            topRight: Radius.circular(
              defaultBorderRadius,
            ),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 15,
              color: grey,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Checkbox(
              checkColor: white,
              activeColor: secondaryGreen,
              value: isSelectedAll,
              onChanged: (value) {
                setState(() {
                  isSelectedAll = value!;
                  selectedItems.clear();
                  for (var element in data) {
                    if (element['value'] == false) {
                      element['value'] = true;
                      selectedItems.add({
                        'id': element['id'],
                        'title': element['title'],
                        'stok': element['stok'],
                        'harga': element['harga'],
                        'jumlah': element['jumlah'],
                        'image': element['image'],
                        'value': value,
                      });
                    } else {
                      element['value'] = false;
                      selectedItems.remove(element);
                    }
                  }
                  log("$stateItemAll");

                  summaryItems = selectedItems.isEmpty
                      ? 0
                      : selectedItems
                          .map((e) => e['harga'] * e['jumlah'])
                          .reduce((value, element) => value + element);
                });
              },
            ),
            Text(
              "Semua",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
            const Spacer(),
            Text(
              "Total",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Text(
              "Rp${formatCurrency(summaryItems)}",
              style: primaryTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            GestureDetector(
              onTap: () {
                showModal();
                log("Ayaa: $selectedItems");
              },
              child: SvgPicture.asset("assets/svg/arrow-up.svg"),
            ),
          ],
        ),
      ),
    );
  }
}
