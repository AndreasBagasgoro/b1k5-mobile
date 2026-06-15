import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/my_schedule/presentation/widgets/my_schedule_tab_menu.dart';

class MySchedulePanel extends StatefulWidget {
  const MySchedulePanel({super.key});

  @override
  State<MySchedulePanel> createState() => _MySchedulePanelState();
}

class _MySchedulePanelState extends State<MySchedulePanel> {
  String _selectedTab = 'Scheduled';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Schedule list",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          MyScheduleTabMenu(
            selectedTab: _selectedTab,
            onTabChanged: (tab) {
              setState(() {
                _selectedTab = tab;
              });
            },
          ),
          const SizedBox(height: 60),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Placeholder for empty schedule illustration
                Image.asset(
                  'assets/features/my_schedule/images/no_schedule.webp',
                  height: 150,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.event_busy,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "You don't have any schedules yet!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Create your first schedule and make your transactions easier.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
