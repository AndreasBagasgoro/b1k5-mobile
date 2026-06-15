import 'package:flutter/material.dart';
import 'package:b1k5_mobile/features/my_schedule/presentation/widgets/my_schedule_header.dart';
import 'package:b1k5_mobile/features/my_schedule/presentation/widgets/my_schedule_panel.dart';

class MainMySchedule extends StatefulWidget {
  const MainMySchedule({super.key});

  @override
  State<MainMySchedule> createState() => _MainMyScheduleState();
}

class _MainMyScheduleState extends State<MainMySchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF910A19), // Red background
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action for adding new schedule
        },
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(Icons.add, color: Color(0xFF910A19), size: 32),
      ),
      body: const Column(
        children: [
          MyScheduleHeader(),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: MySchedulePanel(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
