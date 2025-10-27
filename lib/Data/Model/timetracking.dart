import 'package:flutter_app/Data/Model/user.dart';

class TimeTracking {
  int ID;
  String CreatedAt;
  String UpdatedAt;
  String DeletedAt;
  String ClockIn;
  String ClockOut;
  String Name;
  int UserId;
  TimeTracking({
    required this.ID,
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.DeletedAt,
    required this.ClockIn,
    required this.ClockOut,
    required this.Name,
    required this.UserId,
  });

  factory TimeTracking.fromJson(Map<String, dynamic> x) {
    return TimeTracking(
      ID: x['id'] ?? 0,
      CreatedAt: x['created_at'] ?? '',
      UpdatedAt: x['updated_at'] ?? '',
      DeletedAt: x['deleted_at'] ?? '',
      ClockIn: x['clock_in'] ?? '',
      ClockOut: x['clock_out'] ?? '',
      Name: x['name'] ?? '',
      UserId: x['user_id'] ?? 0,
    );
  }
}
