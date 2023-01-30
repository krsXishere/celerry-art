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
  TabController? tabController;

  final List<Widget> tabs = const [
    HistoryInWidget(),
    HistoryOutPage(),
  ];

  @override
  void initState() {
    tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
    tabController?.addListener(() {
      if (tabController!.index != tabController!.previousIndex) {
        setState(() {
          currentIndex = tabController!.index;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            titleSpacing: 20,
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
              automaticIndicatorColorAdjustment: false,
              splashBorderRadius: BorderRadius.circular(30),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: backgroundColor,
              indicatorWeight: 0.1,
              controller: tabController,
              onTap: ((value) {
                setState(() {
                  currentIndex = value;
                });
              }),
              tabs: [
                Tab(
                  child: Text(
                    "Riwayat Pemasukan",
                    style: primaryTextStyle.copyWith(
                      color: currentIndex == 0 ? primaryGreen : unClickColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Riwayat Pengeluaran",
                    style: primaryTextStyle.copyWith(
                      color: currentIndex == 1 ? primaryGreen : unClickColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: tabController,
            children: tabs,
          ),
        );
      }),
    );
  }
}
