import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'module.dart';

class ModuleTimetable extends StatelessWidget {
  const ModuleTimetable({super.key, required this.x});

  final int x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
          view: CalendarView.workWeek,
          firstDayOfWeek: 1,
          timeSlotViewSettings: const TimeSlotViewSettings(
              startHour: 8,
              endHour: 21,
              nonWorkingDays: <int>[DateTime.saturday, DateTime.sunday]),
          dataSource: MeetingDataSource(getAppointments()),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.red,
            hoverColor: Colors.red[300],
            tooltip: 'Back',
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)));
  }

  List<Appointment> getAppointments() {
    List<Appointment> meetings = <Appointment>[];
    for (var lecturePairs in moduleList[x].lectureTime) {
      meetings.add(Appointment(
          startTime: lecturePairs[0],
          endTime: lecturePairs[1],
          subject: 'LEC',
          color: Colors.pinkAccent,
          recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
    }
    for (var lecturePairs in moduleList[x].tutorialTime) {
      meetings.add(Appointment(
          startTime: lecturePairs[0],
          endTime: lecturePairs[1],
          subject: 'Tut',
          color: Colors.blue,
          recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
    }
    for (var lecturePairs in moduleList[x].labTime) {
      meetings.add(Appointment(
          startTime: lecturePairs[0],
          endTime: lecturePairs[1],
          subject: 'Lab',
          color: Colors.green,
          recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
    }
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
