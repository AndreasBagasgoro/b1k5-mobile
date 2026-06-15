import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/bill_and_top_up/presentation/widgets/bill_and_top_up_header.dart';
import 'package:b1k5_mobile/features/bill_and_top_up/presentation/widgets/bill_and_top_up_menu.dart';
import 'package:b1k5_mobile/features/bill_and_top_up/presentation/widgets/bill_and_top_up_slider.dart';

class MainBillAndTopUp extends StatefulWidget {
  const MainBillAndTopUp({super.key});

  @override
  State<MainBillAndTopUp> createState()=> _MainBillAndTopUpState();
}

class _MainBillAndTopUpState extends State<MainBillAndTopUp> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white, // Sesuaikan dengan MainTransfer
      body: Column(
        children: [
          const BillAndTopUpHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const BillAndTopUpMenu(),
                  const SizedBox(height: 24),
                  const BillAndTopUpSlider(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}