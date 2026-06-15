import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:b1k5_mobile/repositories/auth_repository.dart';
import 'package:b1k5_mobile/core/services/api_services.dart';
import 'package:b1k5_mobile/shared/widgets/button/navbar.dart';
import 'package:go_router/go_router.dart';

class SettingProfile extends StatefulWidget {
  const SettingProfile({super.key});

  @override
  State<SettingProfile> createState() => _SettingProfileState();
}

class _SettingProfileState extends State<SettingProfile> {
  final AuthRepository _authRepository = AuthRepository(ApiService());
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLogin();
  }

  Future<void> _checkLogin() async {
    final loggedIn = await _authRepository.isLoggedIn();
    if (mounted) {
      setState(() {
        _isLoggedIn = loggedIn;
      });
    }
  }

  Future<void> _handleLogout() async {
    await _authRepository.logout();
    if (mounted) {
      // Mengirimkan extra (timestamp) agar ValueKey pada MainNavbar berubah,
      // sehingga halamannya dipaksa untuk di-render ulang.
      context.go('/MainNavbar', extra: DateTime.now().millisecondsSinceEpoch.toString());
    }
  }

  void _handleLogin() {
    context.push('/Login');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Avatar Placeholder
        Container(
          width: 80,
          height: 80,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red.shade100,
          ),
          child: Image.asset(
            'assets/features/profile/icons/octo_cap.png',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 20),

        // Login Button
        Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFe54540),
                Color(0xFFb10707),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: ElevatedButton(
            onPressed: _isLoggedIn ? _handleLogout : _handleLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              elevation: 0,
            ),
            child: Text(
              _isLoggedIn ? 'Logout' : 'Sign Up or Login',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }
}
