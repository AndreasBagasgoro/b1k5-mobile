import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BillAndTopUpSlider extends StatefulWidget {
  const BillAndTopUpSlider({super.key});

  @override
  State<BillAndTopUpSlider> createState() => _BillAndTopUpSliderState();
}

class _BillAndTopUpSliderState extends State<BillAndTopUpSlider> {
  String _selectedTab = 'All';
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double currentScrollPosition = _scrollController.position.pixels;
        double itemWidth = 360.0 + 16.0; // container width + SizedBox width

        double nextScrollPosition = currentScrollPosition + itemWidth;
        
        if (currentScrollPosition >= maxScrollExtent - 10) {
          nextScrollPosition = 0;
        } else if (nextScrollPosition > maxScrollExtent) {
          nextScrollPosition = maxScrollExtent;
        }

        _scrollController.animateTo(
          nextScrollPosition,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  // Widget _buildNewsTab(String label) {
  //   bool isSelected = _selectedTab == label;
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         _selectedTab = label;
  //       });
  //     },
  //     child: Container(
  //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
  //       decoration: BoxDecoration(
  //         color: isSelected ? const Color(0xFF910A19).withOpacity(0.1) : Colors.transparent,
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       child: Text(
  //         label,
  //         style: TextStyle(
  //           color: isSelected ? const Color(0xFF910A19) : Colors.grey,
  //           fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
  //           fontSize: 13,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildNewsCard(String imagePath) {
    bool isSvg = imagePath.toLowerCase().endsWith('.svg');

    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: isSvg
            ? SvgPicture.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
            : Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 120,
          child: ListView(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              _buildNewsCard('assets/features/bills_top_up/images/news_1.webp'),
              const SizedBox(width: 16),
              _buildNewsCard('assets/features/bills_top_up/images/news_2.webp'),
              const SizedBox(width: 16),
              _buildNewsCard('assets/features/bills_top_up/images/news_3.webp'),
              const SizedBox(width: 16),
              _buildNewsCard('assets/features/bills_top_up/images/news_4.webp'),
            ],
          ),
        ),
      ],
    );
  }
}
