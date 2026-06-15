import 'package:b1k5_mobile/features/home/presentation/widgets/home_saving_card.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_recommendation.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_e_wallet.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter/material.dart';

import 'package:b1k5_mobile/features/home/presentation/widgets/home_header.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_tab_menu.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_menu_grid.dart';
import 'package:b1k5_mobile/features/home/presentation/widgets/home_news_promo.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:b1k5_mobile/core/services/api_services.dart';
import 'package:b1k5_mobile/repositories/personalization_repository.dart';
import 'package:b1k5_mobile/features/qris/presentation/pages/main_qris.dart';
// import 'package:b1k5_mobile/features/home/presentation/widgets/home_login_card.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  String _selectedTab = 'For You';
  List<RecommendationItem> _recommendations = [];

  @override
  void initState() {
    super.initState();
    _recommendations = _getRecommendationsForSegment('');
    _fetchPersonalization();
  }

  Future<void> _fetchPersonalization() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final customerId = prefs.getString('customer_id');

      if (customerId != null) {
        final repo = PersonalizationRepository(ApiService());
        final personalization = await repo.getPersonalization(customerId);
        final segmentName = personalization.homepage.segment?.name ?? '';

        if (mounted) {
          setState(() {
            _recommendations = _getRecommendationsForSegment(segmentName);
          });
        }
      }
    } catch (e) {
      // Keep default recommendations on error
    }
  }

  List<RecommendationItem> _getRecommendationsForSegment(String segment) {
    switch (segment) {
      case 'digital_spender':
        return [
          RecommendationItem(title: 'Transfer', icon: LucideIcons.send, onTap: () => context.push('/Transfer')),
          RecommendationItem(title: 'QRIS Tap', icon: LucideIcons.scanLine, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MainQris()))),
          RecommendationItem(title: 'Bills & Top Up', icon: LucideIcons.trendingUp, onTap: () => context.push('/BillAndTopUp')),
          RecommendationItem(title: 'Electronic Card', icon: LucideIcons.creditCard, onTap: () => context.push('/ElectronicCard')),
        ];
      case 'bill_payer':
        return [
          RecommendationItem(title: 'Bills & Top Up', icon: LucideIcons.trendingUp, onTap: () => context.push('/BillAndTopUp')),
          RecommendationItem(title: 'Saving & Deposit', icon: LucideIcons.shieldCheck, onTap: () => context.push('/Saving')),
          RecommendationItem(title: 'My Schedule', icon: LucideIcons.landmark, onTap: () => context.push('/MySchedule')),
        ];
      case 'investor':
        return [
          RecommendationItem(title: 'Investment', icon: LucideIcons.pieChart, onTap: () => context.push('/Investment')),
          RecommendationItem(title: 'Saving & Deposit', icon: LucideIcons.shieldCheck, onTap: () => context.push('/Saving')),
        ];
      case 'low_activity':
        return [
          RecommendationItem(title: 'Electronic Card', icon: LucideIcons.creditCard, onTap: () => context.push('/ElectronicCard')),
          RecommendationItem(title: 'QRIS Tap', icon: LucideIcons.scanLine, onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MainQris()))),
          RecommendationItem(title: 'Bills & Top Up', icon: LucideIcons.trendingUp, onTap: () => context.push('/BillAndTopUp')),
        ];
      default:
        return [
          RecommendationItem(title: 'Bill & Top Up', icon: LucideIcons.trendingUp, onTap: () => context.push('/BillAndTopUp')),
          RecommendationItem(title: 'Saving & Deposit', icon: LucideIcons.shieldCheck, onTap: () => context.push('/Saving')),
          RecommendationItem(title: 'My Schedule', icon: LucideIcons.landmark, onTap: () => context.push('/MySchedule')),
        ];
    }
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
                  const SizedBox(height: 24),
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
                            const SizedBox(height: 100),
                            HomeRecommendation(
                              title: 'Recommendation',
                              subtitle: 'Specially curated just for you',
                              items: _recommendations,
                            ),
                            SizedBox(height: 24),
                            HomeTabMenu(
                              selectedTab: _selectedTab,
                              onTabChanged: (tab) {
                                setState(() {
                                  _selectedTab = tab;
                                });
                              },
                            ),
                            const SizedBox(height: 30),
                            HomeMenuGrid(selectedTab: _selectedTab),
                            const SizedBox(height: 30),
                            const HomeEWallet(),
                            const SizedBox(height: 30),
                            const HomeNewsPromo(),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                      // const HomeLoginCard(),
                      const HomeSavingCard()
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


