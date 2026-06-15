import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/electronic_card/presentation/widgets/card.dart';
import 'package:b1k5_mobile/features/electronic_card/presentation/widgets/detail_card_header.dart';
import 'package:b1k5_mobile/shared/widgets/button/custom_button.dart';
import 'package:b1k5_mobile/shared/widgets/button/pin_auth.dart';

class ElectronicCardDetail extends StatefulWidget {
  final Map<String, dynamic> cardData;

  const ElectronicCardDetail({super.key, required this.cardData});

  @override
  State<ElectronicCardDetail> createState() => _ElectronicCardDetailState();
}

class _ElectronicCardDetailState extends State<ElectronicCardDetail> {
  bool _isDefaultCard = false;
  bool _isCensored = true;

  @override
  Widget build(BuildContext context) {
    String cardNumber = widget.cardData['cardNumber'] ?? '';
    String displayCardNumber =
        _isCensored && cardNumber.length >= 4
            ? '**** **** **** ${cardNumber.substring(cardNumber.length - 4)}'
            : cardNumber;

    String expDate = widget.cardData['expirationDate'] ?? '12/28';
    List<String> expParts = expDate.split('/');
    String expMonth = expParts.isNotEmpty ? expParts[0] : '12';
    String expYear = expParts.length > 1 ? expParts[1] : '28';

    String cvc = widget.cardData['cvc'] ?? '123';
    String displayCvc = _isCensored ? '***' : cvc;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const DetailCardHeader(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Render Card yang diklik
                  ElectronicCard(
                    type: widget.cardData['type'],
                    network: widget.cardData['network'],
                    cardNumber: widget.cardData['cardNumber'],
                    cardName: widget.cardData['cardName'],
                    gradientColors: widget.cardData['gradientColors'],
                    isCensored: _isCensored,
                  ),
                  const SizedBox(height: 32),

                  // Text Enter Information
                  const Text(
                    "Enter Information",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Field Card Number + Logo
                  const Text(
                    "Card Number",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      border: Border.all(color: Color(0xFFF1F1F1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          displayCardNumber,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8A1816),
                          ),
                        ),
                        Image.asset(
                          widget.cardData['network'].toString().toLowerCase() ==
                                  'visa'
                              ? 'assets/features/electronic_card/icons/visa.webp'
                              : 'assets/features/electronic_card/icons/mastercard.webp',
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Field Card Holder
                  const Text(
                    "Card Holder",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      border: Border.all(color: Color(0xFFF1F1F1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.cardData['cardName'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF8A1816),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Row Expiration Date & CVC
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Expiration Date",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F1F1),
                                      border: Border.all(
                                        color: const Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      expMonth, // Bulan
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF8A1816),
                                      ),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    "/",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 14,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F1F1),
                                      border: Border.all(
                                        color: const Color(0xFFF1F1F1),
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      expYear, // Tahun
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF8A1816),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: 90,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "CVC",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1F1F1),
                                border: Border.all(
                                  color: const Color(0xFFF1F1F1),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                displayCvc,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF8A1816),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Toggle Mark as default card
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Switch(
                        value: _isDefaultCard,
                        activeColor: Colors.white,
                        activeTrackColor: const Color(0xFF910A19),
                        inactiveThumbColor: const Color(0xFF910A19),
                        inactiveTrackColor: Colors.white,
                        trackOutlineColor: MaterialStateProperty.all(
                          const Color(0xFF910A19),
                        ),
                        onChanged: (value) {
                          setState(() {
                            _isDefaultCard = value;
                          });
                        },
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        "Mark as default card",
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  CustomButton(
                    text: "View Detail Card",
                    backgroundColor: const Color(0xFF910A19),
                    textColor: Colors.white,
                    borderRadius: 24,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder:
                            (context) => Container(
                              height: MediaQuery.of(context).size.height * 0.7,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(24),
                                ),
                              ),
                              child: PinAuth(
                                onPinCompleted: (pin) {
                                  setState(() {
                                    _isCensored = false;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                      );
                    },
                  ),
                  const SizedBox(height: 40), // Spacing for bottom safe area
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
