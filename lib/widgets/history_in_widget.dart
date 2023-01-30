import 'package:celerry_art/common/theme.dart';
import 'package:flutter/material.dart';

class HistoryInWidget extends StatefulWidget {
  const HistoryInWidget({super.key});

  @override
  State<HistoryInWidget> createState() => HistoryInWidgetState();
}

class HistoryInWidgetState extends State<HistoryInWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(defaultBorderRadius),
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
                          borderRadius:
                              BorderRadius.circular(defaultBorderRadius),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bunga Imitasi",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Stok: 30",
                                  style: primaryTextStyle.copyWith(
                                    color: unClickColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Rp5.000",
                                  style: primaryTextStyle,
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "18/1/2023",
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
    );
  }
}
