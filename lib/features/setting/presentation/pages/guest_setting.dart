import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_header.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_profile.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_menu.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_menu_item.dart';

class GuestSettingPage extends StatelessWidget {
  const GuestSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Theme',
        'subtitle': 'Default',
        'showBorder': true,
        'onTap': () {
          print("Guest Theme Tap");
        },
      },
      {
        'title': 'About',
        'subtitle': 'Privacy Policy and our social media info',
        'showBorder': true,
        'onTap': () {
          print("Guest About Tap");
        },
      },
      {
        'title': 'Version',
        'trailingText': '3.1.84',
        'showBorder': false,
        'onTap': () {
          // TODO: Add navigation or action here
        },
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SettingHeader(),
            const SizedBox(height: 30),
            const SettingProfile(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: Image.asset(
                          'assets/features/home/icons/display_and_others.webp',
                          width: 20,
                          height: 20,
                        ),
                      ),
                      Text(
                        'Display & Others',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SettingMenu(
                    items: menuItems.map((item) => SettingMenuItem(
                      title: item['title'] as String,
                      subtitle: item['subtitle'] as String?,
                      trailingText: item['trailingText'] as String?,
                      showBorder: item['showBorder'] as bool,
                      useToggle: item['useToggle'] as bool? ?? false,
                      onTap: item['onTap'] as VoidCallback?,
                    )).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
