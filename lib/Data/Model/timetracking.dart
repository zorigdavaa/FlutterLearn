import 'package:flutter/foundation.dart';
import 'package:flutter_app/Data/Model/user.dart';

class TimeTracking {
  int ID;
  String CreatedAt;
  String UpdatedAt;
  String DeletedAt;
  String ClockIn;
  String ClockOut;
  int UserID;
  User UserIts;
  TimeTracking({
    required this.ID,
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.DeletedAt,
    required this.ClockIn,
    required this.ClockOut,
    required this.UserID,
    required this.UserIts,
  });

  factory TimeTracking.fromJson(Map<String, dynamic> x) {
    return TimeTracking(
      ID: x['ID'] ?? 0,
      CreatedAt: x['CreatedAt'] ?? '',
      UpdatedAt: x['UpdatedAt'] ?? '',
      DeletedAt: x['DeletedAt'] ?? '',
      ClockIn: x['ClockIn'] ?? '',
      ClockOut: x['ClockOut'] ?? '',
      UserID: x['UserID'] ?? 0,
      UserIts: x['User'] != null ? User.fromJson(x['User']) : User.empty(),
    );
  }
}
