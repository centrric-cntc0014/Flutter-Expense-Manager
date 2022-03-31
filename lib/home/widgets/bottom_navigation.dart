import 'package:flutter/material.dart';

import '../homescreen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HomeScreen.selectedIndexNotifier,
        builder: (BuildContext ctx, int updatedIndex, Widget? _) {
          return BottomNavigationBar(
            elevation: 1.0,
            backgroundColor: Colors.deepPurpleAccent[200],
            selectedItemColor: Colors.white,
            onTap: (newIndex) {
              HomeScreen.selectedIndexNotifier.value = newIndex;
            },
            currentIndex: updatedIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Transactions"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: "Category")
            ],
          );
        });
  }
}
