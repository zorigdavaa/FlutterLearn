class TimeTrack {
  String date = "";
  String clockIn = "";
  String clockOut = "";
  String workedHours = "";

  TimeTrack({
    required this.date,
    required this.clockIn,
    required this.clockOut,
    required this.workedHours,
  });
  factory TimeTrack.fromJson(Map<String, dynamic> json) {
    return TimeTrack(
      date: json['Date'] ?? '',
      clockIn: json['ClockIn'] ?? '',
      clockOut: json['ClockOut'] ?? '',
      workedHours: json['WorkedHours'] ?? '',
    );
  }
}
