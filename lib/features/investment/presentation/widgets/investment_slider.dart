import 'dart:async';
import 'package:flutter/material.dart';

class InvestmentSlider extends StatefulWidget {
  const InvestmentSlider({super.key});

  @override
  State<InvestmentSlider> createState() => _InvestmentSliderState();
}

class _InvestmentSliderState extends State<InvestmentSlider> {
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
        double itemWidth = 360.0 + 16.0;

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

  Widget _buildProductCard(String imagePath) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: Colors.white,
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
        child: Image.asset(
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
              _buildProductCard('assets/features/bills_top_up/images/news_1.webp'),
              const SizedBox(width: 16),
              _buildProductCard('assets/features/bills_top_up/images/news_2.webp'),
              const SizedBox(width: 16),
              _buildProductCard('assets/features/bills_top_up/images/news_3.webp'),
              const SizedBox(width: 16),
              _buildProductCard('assets/features/bills_top_up/images/news_4.webp'),
            ],
          ),
        ),
      ],
    );
  }
}
