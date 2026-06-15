import 'package:flutter/material.dart';

class SavingPanel extends StatelessWidget {
  const SavingPanel({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list mapping untuk Saving Cards
    final List<Map<String, dynamic>> savingCards = [
      {
        'title': 'Savings Account',
        'interest': '3.0% p.a',
        'icon': Icons.account_balance_wallet,
        'color': const Color(0xFF910A19),
      },
      {
        'title': 'Installment Savings',
        'interest': '2.5% p.a',
        'icon': Icons.credit_card,
        'color': const Color(0xFF00563B),
      },
      {
        'title': 'Time Deposit',
        'interest': '4.5% p.a',
        'icon': Icons.savings,
        'color': const Color(0xFF2E3192),
      },
      {
        'title': 'Hajj Registration',
        'interest': '1.0% p.a',
        'icon': Icons.school,
        'color': const Color(0xFFE58D00),
      },
    ];

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Savings & Deposit",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.9,
            ),
            itemCount: savingCards.length,
            itemBuilder: (context, index) {
              final card = savingCards[index];
              return _buildSavingCard(card);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSavingCard(Map<String, dynamic> cardData) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFFFFFF),
            Color(0xFFF4F4F4),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFD5D5D5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cardData['color'].withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              cardData['icon'],
              color: cardData['color'],
              size: 28,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            cardData['title'],
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            "Interest ${cardData['interest']}",
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
