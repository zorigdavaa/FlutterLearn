import 'package:flutter/material.dart';
import 'package:flutter_app/views/Providers/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(
              icon: Icon(Icons.today),
              label: "Time Tracks",
            ),
            NavigationDestination(
              icon: Icon(Icons.watch),
              label: "Todays Tracks",
            ),
          ],
          onDestinationSelected: (int value) {
            // print("pressed " + value.toString());
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
