import 'package:flutter/material.dart';
import 'package:flutter_app/Data/DataSource/api_bc.dart';
import 'package:flutter_app/Data/Model/timetrackUnit.dart';
import 'package:flutter_app/Data/Model/user.dart';
import 'package:flutter_app/views/Providers/providers.dart';
import 'package:flutter_app/views/UI/pages/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeTracksPage extends ConsumerStatefulWidget {
  const TimeTracksPage({super.key});

  @override
  ConsumerState<TimeTracksPage> createState() => _TimeTracksPageState();
}

class _TimeTracksPageState extends ConsumerState<TimeTracksPage> {
  List<TimeTrackUnit> timeTracks = [];
  User? user;

  @override
  void initState() {
    super.initState();
    user = ref.read(userProvider);
    if (user == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return LoginPage();
            },
          ),
        );
      });
    } else {
      fetchMyTimeTracks().then((value) {
        setState(() {
          timeTracks = value.take(20).toList();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return Center(child: Text("Please login to view your time tracks."));
    }
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
