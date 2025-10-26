import 'package:flutter_app/Data/Model/user.dart';
import 'package:flutter_app/views/RiverPodNotifiers/userNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_riverpod/legacy.dart';

// final OlduserProvider = StateProvider<User?>((ref) => null);
final userProvider = NotifierProvider<UserNotifier, User?>(UserNotifier.new);
