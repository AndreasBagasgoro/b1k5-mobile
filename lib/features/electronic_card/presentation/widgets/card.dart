import 'package:flutter/material.dart';

class ElectronicCard extends StatelessWidget {
  final String type; // "Debit" or "Kredit"
  final String network; // "Visa" or "MasterCard"
  final String cardName;
  final String cardNumber;
  final List<Color> gradientColors;
  final bool isCensored;

  const ElectronicCard({
    super.key,
    required this.type,
    required this.network,
    required this.cardName,
    required this.cardNumber,
    this.gradientColors = const [Color(0xFF910A19), Color(0xFF6B0611)],
    this.isCensored = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Bagian Atas: Tipe dan Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              Image.asset(
                network.toLowerCase() == 'visa' 
                    ? 'assets/features/electronic_card/icons/visa.webp'
                    : 'assets/features/electronic_card/icons/mastercard.webp',
                height: 48, // Sesuaikan tinggi logo agar pas di sudut
                fit: BoxFit.contain,
              ),
            ],
          ),
          
          // Bagian Bawah: Nomor dan Nama Rekening
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardName,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                isCensored && cardNumber.length >= 4 
                    ? '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}'
                    : cardNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
