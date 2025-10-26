import 'package:flutter/material.dart';
import 'package:flutter_app/Data/DataSource/api_bc.dart' as api_bc;
import 'package:flutter_app/Data/Model/user.dart';
import 'package:flutter_app/views/Providers/providers.dart';
import 'package:flutter_app/views/UI/pages/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? user = ref.watch(userProvider);
    return Center(
      child: Column(
        children: [
          Text(
            "Home Page",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),

          IconButton(
            onPressed: () {
              user == null
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    )
                  : {
                      api_bc.deleteToken(),
                      ref.read(userProvider.notifier).setUser(null),
                    };
            },
            icon: user == null ? Icon(Icons.login) : Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
