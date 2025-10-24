import 'package:flutter/material.dart';
import 'package:flutter_app/Data/DataSource/api_bc.dart';
import 'package:flutter_app/Data/Model/timetracking.dart';
import 'package:flutter_app/Data/Model/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeTracksToday extends ConsumerStatefulWidget {
  const TimeTracksToday({super.key});

  @override
  ConsumerState<TimeTracksToday> createState() => _TimeTracksTodayState();
}

class _TimeTracksTodayState extends ConsumerState<TimeTracksToday> {
  List<TimeTracking> TrackedUsers = [];
  List<User> UntrackedUsers = [];

  @override
  void initState() {
    var result = fetchTodaysTimeTracks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          ],
        ),
      ],
    );
  }
}
