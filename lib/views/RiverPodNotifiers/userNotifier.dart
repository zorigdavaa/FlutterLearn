import 'package:flutter_app/Data/Model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNotifier extends Notifier<User?> {
  @override
  User? build() {
    return null;
  }

  void setUser(User? user) {
    state = user;
  }
}
