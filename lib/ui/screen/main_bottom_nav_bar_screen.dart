import 'package:flutter/material.dart';
import 'package:tm_app_with_firebase/ui/screen/cancelled_task_screen.dart';
import 'package:tm_app_with_firebase/ui/screen/completed_task_screen.dart';
import 'package:tm_app_with_firebase/ui/screen/new_task_screen.dart';
import 'package:tm_app_with_firebase/ui/screen/progress_screen.dart';
import 'package:tm_app_with_firebase/ui/widgets/tm_app_bar.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    NewTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
    ProgressScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TM_Appbar(),
      body: _screens[_selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          _selectedIndex = index;
          setState(() {});
        },
        // Provide the current selected index
        destinations: const [
          NavigationDestination(icon: Icon(Icons.new_label), label: 'New'),
          NavigationDestination(
            icon: Icon(Icons.check_circle),
            label: 'Completed',
          ),
          NavigationDestination(icon: Icon(Icons.close), label: 'Cancelled'),
          NavigationDestination(
            icon: Icon(Icons.access_time_outlined),
            label: 'Progress',
          ),
          // Add more destinations if needed
        ],
      ),
    );
  }


}

