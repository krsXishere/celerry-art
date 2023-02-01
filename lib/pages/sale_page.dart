import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
                // SizedBox(
                //   child: Row(
                //     children: [
                //       SvgPicture.asset(
                //         "top-seller-1.svg",
                //       ),
                //       ListTile(
                //         leading: Container(
                //           decoration: BoxDecoration(
                //             color: secondaryGreen,
                //             borderRadius:
                //                 BorderRadius.circular(defaultBorderRadius),
                //           ),
                //           child: const FlutterLogo(size: 100),
                //         ),
                //         title: Text(
                //           "Bouqet Extra Small",
                //           style: primaryTextStyle.copyWith(
                //               fontSize: 18, fontWeight: medium),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
