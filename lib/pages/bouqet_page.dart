import 'package:celerry_art/common/theme.dart';
import 'package:celerry_art/pages/checkout_custom_page.dart';
import 'package:celerry_art/pages/checkout_page.dart';
import 'package:celerry_art/pages/edit_bouqet_page.dart';
import 'package:celerry_art/pages/insert_bouqet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class BouqetPage extends StatefulWidget {
  const BouqetPage({super.key});

  @override
  State<BouqetPage> createState() => _BouqetPageState();
}

class _BouqetPageState extends State<BouqetPage> {
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
                    "Celerry Bouqet",
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
                          child: const InsertBouqetPage(),
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
                          child: const EditBouqetPage(),
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
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  //ganti jadi listview
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const CheckOutPage(
                                hargaBouqet: 35000,
                              ),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
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
                                        defaultBorderRadius),
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
                                            "Bouqet Extra Small",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "Rp35.000",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const CheckOutPage(
                                hargaBouqet: 60000,
                              ),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
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
                                        defaultBorderRadius),
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
                                            "Bouqet Silver",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "Rp60.000",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const CheckOutPage(
                                hargaBouqet: 100000,
                              ),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
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
                                        defaultBorderRadius),
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
                                            "Bouqet Gold",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "Rp100.000",
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: const CheckOutCustomPage(
                                hargaBouqet: 150000,
                              ),
                              type: PageTransitionType.rightToLeft,
                            ),
                          );
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
                                        defaultBorderRadius),
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
                                            "Bouqet Platinum",
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "Rp150.000",
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
