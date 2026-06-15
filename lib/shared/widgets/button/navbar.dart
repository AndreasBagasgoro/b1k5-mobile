import 'package:b1k5_mobile/features/setting/presentation/pages/guest_setting.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:b1k5_mobile/features/home/presentation/pages/user_home.dart';
import 'package:b1k5_mobile/features/home/presentation/pages/guest_home.dart';
import 'package:b1k5_mobile/features/my_account/presentation/pages/my_account.dart';
import 'package:b1k5_mobile/features/wealth/presentation/pages/wealth.dart';
import 'package:b1k5_mobile/features/setting/presentation/pages/user_setting.dart';
import 'package:b1k5_mobile/features/qris/presentation/pages/main_qris.dart';
import 'package:b1k5_mobile/features/auth/presentation/pages/login_screen.dart';

class MainNavbar extends StatefulWidget {
  const MainNavbar({super.key});

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {
  int _selectedIndex = 0;
  bool _isLoggedIn = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    
    // Memberikan output ke terminal saat aplikasi berjalan
    print('=== [DEBUG] LOGIN STATUS CHECK ===');
    print('Token: $token');
    print('Is Logged In: ${token != null && token.isNotEmpty}');
    print('==================================');
    
    if (mounted) {
      setState(() {
        _isLoggedIn = token != null && token.isNotEmpty;
        _isLoading = false;
      });
    }
  }

  List<Widget> get _pages => [
        _isLoggedIn ? const UserHomePage() : const GuestHomePage(),
        const MyAccountPage(),
        const WealthPage(),
        _isLoggedIn ? const UserSettingPage() : const GuestSettingPage(),
      ];

  void _onItemTapped(int index) {
    // Middleware / Auth guard logic
    // Jika belum login dan mencoba klik menu selain Home (index 0) dan Setting (index 3), arahkan ke Login
    if (!_isLoggedIn && index != 0 && index != 3) {
      context.push('/Login');
      return;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _isLoggedIn ? const MainQris() : const LoginScreen(),
            ),
          );
        },
        backgroundColor: const Color(0xFF910A19), // Merah bata / Maroon
        shape: const CircleBorder(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pay',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w300,
              ),
            ),
            Image.asset(
              'assets/features/home/icons/qris_logo.webp',
              color: Colors.white,
              width: 40,
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(0, 0, 0, 0),
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, -2), // Shadow mengarah ke atas
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          ),
          child: BottomAppBar(
            color: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 0, // Matikan elevation default
            clipBehavior: Clip.antiAlias,
            shape: const CircularNotchedRectangle(),
            notchMargin: 10.0,
            child: SizedBox(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNavItem(
                        icon: Icons.home_filled,
                        label: 'Home',
                        index: 0,
                      ),
                      _buildNavItem(
                        icon: Icons.credit_card,
                        label: 'My Accounts',
                        index: 1,
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNavItem(
                        icon: Icons.monetization_on,
                        label: 'Wealth',
                        index: 2,
                      ),
                      _buildNavItem(
                        icon: Icons.settings,
                        label: 'Settings',
                        index: 3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedIndex == index;
    final color = isSelected ? const Color(0xFFf75956) : Colors.grey;

    return MaterialButton(
      minWidth: 80,
      padding: EdgeInsets.zero,
      onPressed: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
