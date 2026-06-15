import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:b1k5_mobile/features/home/presentation/pages/user_home.dart';
import 'package:b1k5_mobile/features/my_account/presentation/pages/my_account.dart';
import 'package:b1k5_mobile/features/wealth/presentation/pages/wealth.dart';
import 'package:b1k5_mobile/features/splash/presentation/pages/splash.dart';
import 'package:b1k5_mobile/features/auth/presentation/pages/login_screen.dart';
import 'package:b1k5_mobile/features/on_boarding/presentation/pages/main_on_boarding_screen.dart';
import 'package:b1k5_mobile/features/transfer/presentation/pages/main_transfer.dart';
import 'package:b1k5_mobile/features/bill_and_top_up/presentation/pages/main_bill_and_top_up.dart';
import 'package:b1k5_mobile/features/electronic_card/presentation/pages/main_electronic_card.dart';
import 'package:b1k5_mobile/features/saving/presentation/pages/main_saving.dart';
import 'package:b1k5_mobile/features/my_schedule/presentation/pages/main_my_schedule.dart';
import 'package:b1k5_mobile/features/investment/presentation/pages/main_invesment.dart';
import 'package:b1k5_mobile/features/setting/presentation/pages/user_setting.dart';
import 'package:b1k5_mobile/shared/widgets/button/navbar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  redirect: (context, state) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final bool isLoggedIn = token != null && token.isNotEmpty;

    // Rute yang bisa diakses meski belum login
    final publicRoutes = ['/', '/Login', '/MainNavbar', '/OnBoarding'];
    final bool isPublicRoute = publicRoutes.contains(state.matchedLocation);

    if (!isLoggedIn && !isPublicRoute) {
      return '/Login';
    }

    return null;
  },

  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/Login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/Home',
      builder: (context, state) => const UserHomePage(),
    ),
    GoRoute(
      path: '/MyAccount',
      builder: (context, state) => const MyAccountPage(),
    ),
    GoRoute(
      path: '/Wealth',
      builder: (context, state) => const WealthPage(),
    ),
    GoRoute(
      path: '/Setting',
      builder: (context, state) => const UserSettingPage(),
    ),
    GoRoute(
      path: '/OnBoarding',
      builder: (context, state) => const MainOnBoardingScreen(),
    ),
    GoRoute(
      path: '/Transfer',
      builder: (context, state) => const MainTransfer(),
    ),
    GoRoute(
      path: '/BillAndTopUp',
      builder: (context, state) => const MainBillAndTopUp(),
    ),
    GoRoute(
      path: '/ElectronicCard',
      builder: (context, state) => const MainElectronicCard(),
    ),
    GoRoute(
      path: '/Saving',
      builder: (context, state) => const MainSaving(),
    ),
    GoRoute(
      path: '/Investment',
      builder: (context, state) => const MainInvestment(),
    ),
    GoRoute(
      path: '/MySchedule',
      builder: (context, state) => const MainMySchedule(),
    ),
    GoRoute(
      path: '/MainNavbar',
      builder: (context, state) => MainNavbar(
        key: ValueKey(state.extra ?? 'navbar'),
      ),
    ),
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'PlusJakartaSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
