import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/saving/presentation/widgets/saving_header.dart';
import 'package:b1k5_mobile/features/saving/presentation/widgets/saving_slider.dart';
import 'package:b1k5_mobile/features/saving/presentation/widgets/saving_panel.dart';

class MainSaving extends StatefulWidget {
  const MainSaving({super.key});

  @override
  State<MainSaving> createState() => _MainSavingState();
}

class _MainSavingState extends State<MainSaving> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF910A19), // Red background
      body: Column(
        children: [
          SavingHeader(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      SavingSlider(),
                      SizedBox(height: 32),
                    ],
                  ),
                ),
                const SliverFillRemaining(
                  hasScrollBody: true,
                  child: SavingPanel(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
