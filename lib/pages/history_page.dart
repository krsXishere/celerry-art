import 'package:celerry_art/widgets/history_in_widget.dart';
import 'package:celerry_art/widgets/history_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../common/theme.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  // TabController tabController= TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0.0,
            title: Text(
              "CELERRY.art",
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 25,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/svg/celerry-icon-1.svg",
                ),
              ),
            ],
            bottom: TabBar(
              splashBorderRadius: BorderRadius.circular(30),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: black,
              indicatorWeight: 3,
              onTap: ((value) {
                setState(() {
                  currentIndex = value;
                  print(DefaultTabController.of(context)?.index);
                });
              }),
              tabs: [
                Tab(
                  child: Text(
                    "Riwayat Pemasukan",
                    style: primaryTextStyle.copyWith(
                      color: DefaultTabController.of(context)?.index == 0
                          ? primaryGreen
                          : unClickColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Riwayat Pengeluaran",
                    style: primaryTextStyle.copyWith(
                      color: DefaultTabController.of(context)?.index == 1
                          ? primaryGreen
                          : unClickColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            // controller: tabController,
            children: [
              HistoryInWidget(),
              HistoryOutPage(),
            ],
          ),
        );
      }),
    );
  }
}
