import 'package:flutter/material.dart';
import 'package:flutter_app/Data/DataSource/api_bc.dart';
import 'package:flutter_app/Data/Model/timetrack.dart';

class TimeTracksPage extends StatefulWidget {
  const TimeTracksPage({super.key});

  @override
  State<TimeTracksPage> createState() => _TimeTracksPageState();
}

class _TimeTracksPageState extends State<TimeTracksPage> {
  List<TimeTrack> timeTracks = [];

  @override
  void initState() {
    super.initState();
    fetchMyTimeTracks().then((value) {
      setState(() {
        timeTracks = value.take(20).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ElevatedButton(
            onPressed: () {
              clockIn();
            },
            child: Text("Бүртгүүлэх"),
          ),
          trailing: ElevatedButton(
            onPressed: () {
              clockOut();
            },
            child: Text("Тарах"),
          ),
        ),
        Table(
          border: TableBorder.all(),
          columnWidths: {
            0: FlexColumnWidth(1),
            1: FlexColumnWidth(1),
            2: FlexColumnWidth(1),
            3: FlexColumnWidth(2),
          },
          children: [
            TableRow(
              children: [
                Text(
                  "Date",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text("Clock In", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  "Clock Out",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Worked Hours",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            for (var track in timeTracks)
              TableRow(
                children: [
                  Text(track.date.substring(0, 10)),
                  Text(track.clockIn.toString()),
                  Text(track.clockOut.toString()),
                  Text(track.workedHours.toString()),
                ],
              ),
          ],
        ),
      ],
    );
  }

  void clockIn() async {
    bool success = await startMyTimeTracks();
    if (success) {
      await setTimeTracks();
    }
  }

  void clockOut() async {
    bool success = await endMyTimeTracks();
    if (success) {
      await setTimeTracks();
    }
  }

  Future<void> setTimeTracks() async {
    var value = await fetchMyTimeTracks();
    setState(() {
      timeTracks = value.take(20).toList();
    });
  }
}
