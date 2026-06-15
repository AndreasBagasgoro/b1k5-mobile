import 'package:flutter/material.dart';

import 'package:b1k5_mobile/features/home/presentation/widgets/home_header.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_tab_menu.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_menu_grid.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_news_promo.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_login_card.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_introduce_card.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_disclosure_sheet.dart';

class GuestHomePage extends StatefulWidget {
  const GuestHomePage({super.key});

  @override
  State<GuestHomePage> createState() => _GuestHomePageState();
}

class _GuestHomePageState extends State<GuestHomePage> {
  String _selectedTab = 'For You';
  static bool _hasShownDisclosure = false;

  @override
  void initState() {
    super.initState();
    if (!_hasShownDisclosure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showDisclosureSheet();
        _hasShownDisclosure = true;
      });
    }
  }

  void _showDisclosureSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: const HomeDisclosureSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 260,
              decoration: const BoxDecoration(
                color: Color(0xFF910A19),
              ),
            ),
            SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  const SizedBox(height: 8),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 56),
                            const HomeIntroduceCard(),
                            const SizedBox(height: 12),
                            HomeTabMenu(selectedTab: _selectedTab,
                              onTabChanged: (tab) {
                                setState(() {
                                  _selectedTab = tab;
                                });
                              },),
                            const SizedBox(height: 30),
                            HomeMenuGrid(selectedTab: _selectedTab),
                            const SizedBox(height: 30),
                            const HomeNewsPromo(),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                      const HomeLoginCard(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


