import 'package:flutter/material.dart';
import 'package:flutter_app/Data/DataSource/api_bc.dart';
import 'package:flutter_app/Data/Model/timetracking.dart';
import 'package:flutter_app/Data/Model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeTracksTodayPage extends ConsumerStatefulWidget {
  const TimeTracksTodayPage({super.key});

  @override
  ConsumerState<TimeTracksTodayPage> createState() => _TimeTracksTodayState();
}

class _TimeTracksTodayState extends ConsumerState<TimeTracksTodayPage> {
  List<TimeTracking> TrackedUsers = [];
  List<User> UntrackedUsers = [];

  @override
  void initState() {
    GetData();
    super.initState();
  }

  void GetData() async {
    (List<TimeTracking> timeTracks, List<User> unTrackedUsers) result =
        await fetchTodaysTimeTracks();
    setState(() {
      TrackedUsers = result.$1;
      UntrackedUsers = result.$2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Time Tracks Today'),
        Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                Text("#"),
                Text("Name"),
                Text("Start Time"),
                Text("End Time"),
              ],
            ),
            for (var i = 0; i < TrackedUsers.length; i++)
              TableRow(
                children: [
                  Text((i + 1).toString()),
                  Text(TrackedUsers[i].Name),
                  Text(TrackedUsers[i].ClockIn),
                  Text(TrackedUsers[i].ClockOut),
                ],
              ),
          ],
        ),
        Text('Untracked Users'),
        Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: [Text("#"), Text("Name")]),
            for (var i = 0; i < UntrackedUsers.length; i++)
              TableRow(
                children: [
                  Text((i + 1).toString()),
                  Text(UntrackedUsers[i].firstName),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
