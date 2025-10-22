import 'package:flutter/material.dart';
import 'package:flutter_app/views/Providers/notifiers.dart';
import 'package:flutter_app/views/UI/pages/home_page.dart';
import 'package:flutter_app/views/UI/pages/time_tracks_page.dart';
import 'package:flutter_app/views/UI/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), TimeTracksPage()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  void initState() {
    // TODO: implement initState
    
    super.initState();
  }

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
