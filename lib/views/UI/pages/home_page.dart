import 'package:flutter/material.dart';
import 'package:flutter_app/views/UI/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "Home Page",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.login),
          ),
        ],
      ),
    );
  }
}
