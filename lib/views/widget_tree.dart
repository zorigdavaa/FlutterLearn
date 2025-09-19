import 'package:flutter/material.dart';
import 'package:flutter_app/views/data/notifiers.dart';
import 'package:flutter_app/views/pages/home_page.dart';
import 'package:flutter_app/views/pages/time_tracks_page.dart';
import 'package:flutter_app/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), TimeTracksPage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
        actions: [
          ValueListenableBuilder(
            valueListenable: useDarkModeNotifier,
            builder: (context, value, child) {
              return IconButton(
                onPressed: () {
                  useDarkModeNotifier.value = !useDarkModeNotifier.value;
                },
                icon: Icon(
                  value ? Icons.brightness_7_sharp : Icons.brightness_2_rounded,
                ),
              );
            },
          ),
        ],
      ),

      // body: pages[currentIndex],
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages[selectedPage];
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
