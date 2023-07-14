import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Timetable extends StatefulWidget {
  const Timetable({super.key, required String title});

  @override
  State<Timetable> createState() => _TimetableState();
}

class _TimetableState extends State<Timetable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
          view: CalendarView.workWeek,
          firstDayOfWeek: 1,
          timeSlotViewSettings: const TimeSlotViewSettings(
              startHour: 9,
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
          child: Icon(Icons.arrow_back_ios_new)
        ));
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 19, 9, 0, 0),
      endTime: DateTime(2023, 6, 19, 10, 0, 0),
      subject: 'TUT [01]',
      color: Colors.blueAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 19, 10, 0, 0),
      endTime: DateTime(2023, 6, 19, 11, 0, 0),
      subject: 'TUT [02]',
      color: Colors.blueAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 19, 11, 0, 0),
      endTime: DateTime(2023, 6, 19, 12, 0, 0),
      subject: 'TUT [03]',
      color: Colors.blueAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 19, 12, 0, 0),
      endTime: DateTime(2023, 6, 19, 13, 0, 0),
      subject: 'TUT [04]',
      color: Colors.blueAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 19, 13, 0, 0),
      endTime: DateTime(2023, 6, 19, 14, 0, 0),
      subject: 'TUT [05]',
      color: Colors.blueAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 19, 14, 0, 0),
      endTime: DateTime(2023, 6, 19, 15, 0, 0),
      subject: 'TUT [06]',
      color: Colors.blueAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 20, 12, 0, 0),
      endTime: DateTime(2023, 6, 20, 14, 0, 0),
      subject: 'LEC[1]',
      color: Colors.pinkAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 23, 10, 0, 0),
      endTime: DateTime(2023, 6, 23, 12, 0, 0),
      subject: 'LAB[1]',
      color: Colors.deepPurpleAccent
      ,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 23, 12, 0, 0),
      endTime: DateTime(2023, 6, 23, 14, 0, 0),
      subject: 'LAB[2]',
      color: Colors.deepPurpleAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 23, 14, 0, 0),
      endTime: DateTime(2023, 6, 23, 16, 0, 0),
      subject: 'LAB[3]',
      color: Colors.deepPurpleAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
meetings.add(Appointment(
      startTime: DateTime(2023, 6, 22, 9, 0, 0),
      endTime: DateTime(2023, 6, 22, 11, 0, 0),
      subject: 'LAB[4]',
      color: Colors.deepPurpleAccent
      ,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 22, 11, 0, 0),
      endTime: DateTime(2023, 6, 22, 13, 0, 0),
      subject: 'LAB[5]',
      color: Colors.deepPurpleAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 22, 13, 0, 0),
      endTime: DateTime(2023, 6, 22, 15, 0, 0),
      subject: 'LAB[7]',
      color: Colors.deepPurpleAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 23, 16, 0, 0),
      endTime: DateTime(2023, 6, 23, 18, 0, 0),
      subject: 'LAB[7]',
      color: Colors.deepPurpleAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 22, 15, 0, 0),
      endTime: DateTime(2023, 6, 22, 17, 0, 0),
      subject: 'LAB[8]',
      color: Colors.deepPurpleAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
      return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}