import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/theme.dart';

class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
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
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    Container(
                      height: 100,
                      width: 160,
                      decoration: BoxDecoration(
                        color: primaryGreen,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "20",
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 25,
                              color: white,
                            ),
                          ),
                          Text(
                            "Bouqet Extra Small",
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 160,
                      decoration: BoxDecoration(
                        color: secondaryGreen,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "20",
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 25,
                              color: white,
                            ),
                          ),
                          Text(
                            "Bouqet Silver",
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 160,
                      decoration: BoxDecoration(
                        color: creameColor,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "20",
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 25,
                              color: white,
                            ),
                          ),
                          Text(
                            "Bouqet Gold",
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 160,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius:
                            BorderRadius.circular(defaultBorderRadius),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "20",
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              fontSize: 25,
                              color: white,
                            ),
                          ),
                          Text(
                            "Bouqet Platinum",
                            style: primaryTextStyle.copyWith(
                              fontWeight: medium,
                              color: white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "Penjualan Terlaris",
                  style: primaryTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SvgPicture.asset(
                          "assets/svg/top-seller-1.svg",
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: grey.withOpacity(0.3),
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: const EdgeInsets.all(5),
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
                                      child: Text(
                                        "Bouqet Extra Small",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 18,
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SvgPicture.asset(
                          "assets/svg/top-seller-2.svg",
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: grey.withOpacity(0.3),
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: const EdgeInsets.all(5),
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
                                      child: Text(
                                        "Bouqet Silver",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 18,
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
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: SvgPicture.asset(
                          "assets/svg/top-seller-3.svg",
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5,
                                color: grey.withOpacity(0.3),
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  margin: const EdgeInsets.all(5),
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
                                      child: Text(
                                        "Bouqet Platinum",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 18,
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
