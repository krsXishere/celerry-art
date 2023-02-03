import 'package:celerry_art/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  // int quantity = 0;
  List<TextEditingController>? quantityController = [];
  List<Map<String, dynamic>> data = [
    {
      'id': 1,
      'title': 'Bunga imitasi',
      'stok': 30,
      'harga': 3000,
      'image': const FlutterLogo(),
      'value': false,
    },
    {
      'id': 2,
      'title': 'Kertas sage',
      'stok': 30,
      'harga': 3000,
      'image': const FlutterLogo(),
      'value': false,
    },
    {
      'id': 3,
      'title': 'Silverqueen',
      'stok': 30,
      'harga': 30000,
      'image': const FlutterLogo(),
      'value': false,
    }
  ];

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
                "Pilih Bahan",
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(
                height: defaultPadding,
              ),
              ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  quantityController!.add(TextEditingController(text: '0'));
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
                                    GestureDetector(
                                      onTap: () {
                                        if (quantity >= 1) {
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
                                        controller: quantityController?[index],
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.all(0),
                                          filled: false,
                                          border: InputBorder.none,
                                          hintText: "$quantity",
                                          hintStyle: primaryTextStyle.copyWith(
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
                                  "Rp. ${data[index]['harga'].toString()}",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            value: data[index]['value'],
                            onChanged: (value) {
                              setState(() {
                                data[index]['value'] = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
