import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  // ignore: use_super_parameters
  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: SalomonBottomBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: const Color(0xFF1C2020),
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xFF757575),
        items: [
          SalomonBottomBarItem(
            icon: Image.asset(
              currentIndex == 0
                  ? "assets/icons/home_active.png"
                  : "assets/icons/home_inactive.png",
              width: 24,
              height: 24,
            ),
            title: const Text("Home", style: TextStyle(fontSize: 12)),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              currentIndex == 1
                  ? "assets/icons/attendant_active.png"
                  : "assets/icons/attendant_inactive.png",
              width: 24,
              height: 24,
            ),
            title: const Text("Attendant", style: TextStyle(fontSize: 12)),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              currentIndex == 2
                  ? "assets/icons/task_active.png"
                  : "assets/icons/task_inactive.png",
              width: 24,
              height: 24,
            ),
            title: const Text("Task", style: TextStyle(fontSize: 12)),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              currentIndex == 3
                  ? "assets/icons/expense_active.png"
                  : "assets/icons/expense_inactive.png",
              width: 24,
              height: 24,
            ),
            title: const Text("Expense", style: TextStyle(fontSize: 12)),
            selectedColor: Colors.white,
          ),
          SalomonBottomBarItem(
            icon: Image.asset(
              currentIndex == 4
                  ? "assets/icons/leave_active.png"
                  : "assets/icons/leave_inactive.png",
              width: 24,
              height: 24,
            ),
            title: const Text("Leave", style: TextStyle(fontSize: 12)),
            selectedColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
