import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/electronic_card/presentation/widgets/electronic_card_header.dart';
import 'package:b1k5_mobile/features/electronic_card/presentation/widgets/electronic_card_lists.dart';

class MainElectronicCard extends StatefulWidget {
  const MainElectronicCard({super.key});

  @override
  State<MainElectronicCard> createState() => _MainElectronicCardState();
}

class _MainElectronicCardState extends State<MainElectronicCard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ElectronicCardHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  const ElectronicCardLists(),
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
