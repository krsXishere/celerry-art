import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common/theme.dart';

class EditItemPage extends StatefulWidget {
  const EditItemPage({super.key});

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  int quantity = 0;

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Edit Bahan Baku",
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: defaultPadding,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: secondaryGreen,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: const FlutterLogo(),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nama Bahan",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: TextFormField(
                                  cursorColor: secondaryGreen,
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    filled: false,
                                    border: InputBorder.none,
                                    hintText: "Masukkan nama bahan",
                                    hintStyle: primaryTextStyle.copyWith(
                                      fontWeight: regular,
                                      color: grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: unClickColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(
                                        color: unClickColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Harga Bahan Satuan",
                                style: primaryTextStyle.copyWith(
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                                child: TextFormField(
                                  cursorColor: secondaryGreen,
                                  controller: priceController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    filled: false,
                                    border: InputBorder.none,
                                    hintText: "Masukkan Harga bahan",
                                    hintStyle: primaryTextStyle.copyWith(
                                      fontWeight: regular,
                                      fontSize: 15,
                                      color: grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: unClickColor,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(11),
                                      borderSide: BorderSide(
                                        color: unClickColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: defaultPadding,
                            left: defaultPadding,
                            bottom: defaultPadding,
                          ),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    quantity = quantity + 1;
                                    quantityController.text =
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
                              SizedBox(
                                height: 20,
                                width: 30,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  cursorColor: secondaryGreen,
                                  controller: quantityController,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(0),
                                    filled: false,
                                    border: InputBorder.none,
                                    hintText: "$quantity",
                                    hintStyle: primaryTextStyle.copyWith(
                                      fontWeight: regular,
                                    ),
                                    enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (quantity >= 1) {
                                    setState(() {
                                      quantity = quantity - 1;
                                      quantityController.text =
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(bottom: defaultPadding),
        height: 80,
        color: backgroundColor,
        child: Center(
          child: SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: creameColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                "Simpan",
                style: primaryTextStyle.copyWith(
                  color: white,
                  fontWeight: bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
