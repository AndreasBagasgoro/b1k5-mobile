import 'package:flutter/material.dart';
import 'setting_menu_item.dart';

class SettingMenu extends StatelessWidget {
  final List<SettingMenuItem> items;

  const SettingMenu({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 8,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: items,
      ),
    );
  }
}
