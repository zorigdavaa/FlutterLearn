class TimeTrackUnit {
  String date = "";
  String clockIn = "";
  String clockOut = "";
  String workedHours = "";

  TimeTrackUnit.TimeTrackUnit({
    required this.date,
    required this.clockIn,
    required this.clockOut,
    required this.workedHours,
  });
  factory TimeTrackUnit.fromJson(Map<String, dynamic> json) {
    return TimeTrackUnit.TimeTrackUnit(
      date: json['Date'] ?? '',
      clockIn: json['ClockIn'] ?? '',
      clockOut: json['ClockOut'] ?? '',
      workedHours: json['WorkedHours'] ?? '',
    );
  }
}
