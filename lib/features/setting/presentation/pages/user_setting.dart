import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_header.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_profile.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_menu.dart';
import 'package:b1k5_mobile/features/setting/presentation/widgets/setting_menu_item.dart';

class UserSettingPage extends StatelessWidget {
  const UserSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'User ID & PIN OCTO',
        'subtitle': 'Change your OCTO User ID & PIN',
        'showBorder': false,
        'onTap': () {
          print("Test1");
        },
      },
      {
        'title': 'Profile',
        'subtitle': 'Manage your ID card, phone number, email, address, education and employment information',
        'showBorder': true,
        'onTap': () {
          print("Test2");
        },
      },
      {
        'title': 'Fingerprint Login',
        'subtitle': 'Enable now for faster login',
        'showBorder': false,
        'useToggle': true,
        'onTap': () {
          // TODO: Add navigation or action here
        },
      },
      {
        'title': 'Primary Account',
        'subtitle': 'Set your main funding account for transactions',
        'showBorder': false,
        'onTap': () {
          // TODO: Add navigation or action here
        },
      },
      {
        'title': 'Transaction Schedule',
        'subtitle': 'Manage your transaction schedule and enjoy automatic transactions',
        'showBorder': false,
        'onTap': () {
          // TODO: Add navigation or action here
        },
      },
      {
        'title': 'Account Display',
        'subtitle': 'Manage which accounts to display on the home page and My Accounts menu',
        'showBorder': false,
        'onTap': () {
          // TODO: Add navigation or action here
        },
      },
      {
        'title': 'OCTO App Transaction Limit',
        'subtitle': 'Set daily limits for each transaction type',
        'showBorder': false,
        'onTap': () {
          // TODO: Add navigation or action here
        },
      },
      {
        'title': 'BI FAST Alias Settings',
        'subtitle': 'Create or change your BI FAST transaction alias',
        'showBorder': false,
        'onTap': () {
          // TODO: Add navigation or action here
        },
      },
      {
        'title': 'Verify with OCTO',
        'subtitle': 'Verify financial and non-financial activities from other channels via the OCTO App',
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
                    items: menuItems.sublist(0, 3).map((item) => SettingMenuItem(
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
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SettingMenu(
                items: menuItems.sublist(3, 9).map((item) => SettingMenuItem(
                  title: item['title'] as String,
                  subtitle: item['subtitle'] as String?,
                  trailingText: item['trailingText'] as String?,
                  showBorder: item['showBorder'] as bool,
                  useToggle: item['useToggle'] as bool? ?? false,
                  onTap: item['onTap'] as VoidCallback?,
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
