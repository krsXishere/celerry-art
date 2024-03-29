import 'package:celerry_art/common/theme.dart';
import 'package:celerry_art/pages/dashboard_page.dart';
import 'package:celerry_art/pages/history_page.dart';
import 'package:celerry_art/pages/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    DashboardPage(),
    HistoryPage(),
    ReportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages.elementAt(currentIndex),
          Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Align(
              alignment: const Alignment(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      color: grey.withOpacity(0.3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: white,
                    currentIndex: currentIndex,
                    selectedItemColor: primaryGreen,
                    unselectedItemColor: grey,
                    selectedLabelStyle: primaryTextStyle.copyWith(
                      color: primaryGreen,
                    ),
                    unselectedLabelStyle: primaryTextStyle.copyWith(
                      color: black,
                    ),
                    onTap: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/svg/home.svg",
                          color: currentIndex == 0 ? primaryGreen : grey,
                        ),
                        label: "Beranda",
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/svg/history.svg",
                          color: currentIndex == 1 ? primaryGreen : grey,
                        ),
                        label: "Riwayat",
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/svg/curve-cumulative.svg",
                          color: currentIndex == 2 ? primaryGreen : grey,
                        ),
                        label: "Laporan",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
