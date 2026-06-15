import 'package:flutter/material.dart';

class MyScheduleTabMenu extends StatelessWidget {
  final String selectedTab;
  final ValueChanged<String> onTabChanged;

  const MyScheduleTabMenu({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = [
      'Scheduled',
      'Installments',
      'Auto Top-Up',
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: tabs.map((tab) {
        final isSelected = selectedTab == tab;
        return GestureDetector(
          onTap: () {
            onTabChanged(tab);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF910A19).withOpacity(0.1) : Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              tab,
              style: TextStyle(
                color: isSelected ? const Color(0xFF910A19) : Colors.grey,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 13,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
