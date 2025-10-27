import 'package:flutter/material.dart';
import "package:flutter_app/Data/DataSource/api_bc.dart" as api_bc;
import 'package:flutter_app/Data/Model/user.dart';
import 'package:flutter_app/views/Providers/providers.dart';
import 'package:flutter_app/views/UI/pages/home_page.dart';
import 'package:flutter_app/views/widget_tree.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController userNameController = TextEditingController(
    text: "zorigoo.nexus@yahoo.com",
  );
  final TextEditingController passwordController = TextEditingController(
    text: "123456",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: userNameController,
              decoration: InputDecoration(
                // hintText: "Username",
                label: Text("Username"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16), //space between two text fields
            TextFormField(
              controller: passwordController,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                // hintText: "Password",
                label: Text("Password"),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                bool isLoggedIn = await api_bc.login(
                  userNameController.text,
                  passwordController.text,
                );
                if (isLoggedIn) {
                  User? user = await api_bc.verifyToken();
                  ref.read(userProvider.notifier).setUser(user);
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => WidgetTree()),
                      (route) => false,
                    );
                  }
                  print("Login successful");
                } else {
                  print("Login failed");
                }
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
