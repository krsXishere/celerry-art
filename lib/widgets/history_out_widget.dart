import 'package:flutter/material.dart';

import '../common/theme.dart';

class HistoryOutPage extends StatefulWidget {
  const HistoryOutPage({super.key});

  @override
  State<HistoryOutPage> createState() => _HistoryOutPageState();
}

class _HistoryOutPageState extends State<HistoryOutPage> {
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
                                  "Bouqet Extra Small",
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Resep: Kertas 3 gulung, coklat silver 4, dll",
                                  style: primaryTextStyle.copyWith(
                                    color: unClickColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Rp35.000",
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
