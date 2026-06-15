import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/electronic_card/presentation/widgets/card.dart';
import 'package:b1k5_mobile/features/electronic_card/presentation/widgets/electronic_card_detail.dart';

class ElectronicCardLists extends StatelessWidget {
  const ElectronicCardLists({super.key});

  @override
  Widget build(BuildContext context) {
    // Data list mapping untuk Electronic Card
    final List<Map<String, dynamic>> cardsData = [
      {
        'type': 'Debit',
        'network': 'VISA',
        'cardNumber': '4111 2222 3333 4444',
        'cardName': 'Andreas Bagasgoro',
        'expirationDate': '12/28',
        'cvc': '123',
        'gradientColors': [const Color(0xFFDF5145), const Color(0xFFA32920)], // Maroon Gradient
      },
      {
        'type': 'Kredit',
        'network': 'MasterCard',
        'cardNumber': '5555 6666 7777 8888',
        'cardName': 'Andreas Bagasgoro',
        'expirationDate': '08/26',
        'cvc': '456',
        'gradientColors': [const Color(0xFF4B6CB7), const Color(0xFF182848)], // Blue Gradient
      },
      {
        'type': 'Debit',
        'network': 'VISA',
        'cardNumber': '4999 0000 1111 2222',
        'cardName': 'Andreas Bagasgoro',
        'expirationDate': '01/29',
        'cvc': '789',
        'gradientColors': [const Color(0xFF11998E), const Color(0xFF38EF7D)], // Green Gradient
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: cardsData.map((data) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ElectronicCardDetail(cardData: data),
                  ),
                );
              },
              child: ElectronicCard(
                type: data['type'],
                network: data['network'],
                cardNumber: data['cardNumber'],
                cardName: data['cardName'],
                gradientColors: data['gradientColors'],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
