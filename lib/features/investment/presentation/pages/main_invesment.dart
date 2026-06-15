import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/investment/presentation/widgets/investment_header.dart';
import 'package:b1k5_mobile/features/investment/presentation/widgets/investment_slider.dart';
import 'package:b1k5_mobile/features/investment/presentation/widgets/investment_panel.dart';

class MainInvestment extends StatefulWidget {
  const MainInvestment({super.key});

  @override
  State<MainInvestment> createState() => _MainInvestmentState();
}

class _MainInvestmentState extends State<MainInvestment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF910A19), // Red background
      body: Column(
        children: [
          InvestmentHeader(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      InvestmentSlider(),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
                const SliverFillRemaining(
                  hasScrollBody: true,
                  child: InvestmentPanel(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
