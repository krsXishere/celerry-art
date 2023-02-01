import 'package:celerry_art/pages/edit_item_page.dart';
import 'package:celerry_art/pages/insert_item_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../common/theme.dart';

class InventoryInPage extends StatefulWidget {
  const InventoryInPage({super.key});

  @override
  State<InventoryInPage> createState() => InventoryInPageState();
}

class InventoryInPageState extends State<InventoryInPage> {
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
              Row(
                children: [
                  Text(
                    "Bahan Baku",
                    style: primaryTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: SvgPicture.asset("assets/svg/tambah.svg"),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const InsertItemPage(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: SvgPicture.asset("assets/svg/edit.svg"),
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: const EditItemPage(),
                          type: PageTransitionType.rightToLeft,
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: defaultPadding,
              ),
              SizedBox(
                //ganti jadi listview
                child: Column(
                  children: [
                    GestureDetector(
                      onLongPress: () {
                        // print("okeh");
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: defaultPadding),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              color: grey.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: secondaryGreen,
                                  borderRadius: BorderRadius.circular(
                                    defaultBorderRadius,
                                  ),
                                ),
                                child: const FlutterLogo(
                                  size: 80,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: defaultPadding,
                            ),
                            Expanded(
                              flex: 7,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Bunga Imitasi",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 18,
                                            fontWeight: medium,
                                          ),
                                        ),
                                        Text(
                                          "Stok: 30",
                                          style: primaryTextStyle.copyWith(
                                            color: unClickColor,
                                          ),
                                        ),
                                        Text(
                                          "Rp5.000",
                                          style: primaryTextStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
