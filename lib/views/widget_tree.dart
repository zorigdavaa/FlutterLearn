import 'package:flutter/material.dart';
import 'package:flutter_app/Data/Model/user.dart';
import 'package:flutter_app/views/Providers/notifiers.dart';
import 'package:flutter_app/views/Providers/providers.dart';
import 'package:flutter_app/views/UI/pages/home_page.dart';
import 'package:flutter_app/views/UI/pages/login_page.dart';
import 'package:flutter_app/views/UI/pages/time_tracks_page.dart';
import 'package:flutter_app/views/UI/pages/time_tracks_today_page.dart';
import 'package:flutter_app/views/UI/widgets/navbar_widget.dart';
// import 'package:flutter_app/Data/DataSource/api_bc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Data/DataSource/api_bc.dart' as api_bc;

List<Widget> pages = [HomePage(), TimeTracksPage(), TimeTracksTodayPage()];

class WidgetTree extends ConsumerStatefulWidget {
  const WidgetTree({super.key});

  @override
  ConsumerState<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends ConsumerState<WidgetTree> {
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyTokenUser();
  }

  Future<void> verifyTokenUser() async {
    isLoading = true;
    final result = await api_bc.verifyToken();
    if (result == null) {
      await api_bc.deleteToken();
    }
    setState(() {
      ref.read(userProvider.notifier).setUser(result);
      isLoading = false;
      if (result == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
          ),
        );
      }
      // ref.read(userProvider.notifier).state = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    User? user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isLoading
              ? "Loading"
              : user != null
              ? user.firstName
              : 'Please Login',
        ),
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
