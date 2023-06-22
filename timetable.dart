import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: SfCalendar(
      view: CalendarView.workWeek,
      firstDayOfWeek: 1,
      timeSlotViewSettings: TimeSlotViewSettings(
        startHour: 9,
        endHour: 21,
        nonWorkingDays: <int>[DateTime.saturday, DateTime.sunday]),
        dataSource: MeetingDataSource(getAppointments()),
    ));
  } 
    
  }

  List<Appointment> getAppointments(){
    List<Appointment> meetings = <Appointment>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 19, 12,0,0),
    endTime: DateTime(2023, 6, 19, 14,0,0),
    subject: 'CS2030 Lecture',
    color: Colors.pinkAccent,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 21, 12,0,0),
    endTime: DateTime(2023, 6, 21, 13,0,0),
    subject: 'CS2030 Recitation',
    color: Colors.pinkAccent,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 23, 12,0,0),
    endTime: DateTime(2023, 6, 23, 14,0,0),
    subject: 'CS2030 Lab',
    color: Colors.pinkAccent,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 19, 9,0,0),
    endTime: DateTime(2023, 6, 19, 12,0,0),
    subject: 'IS2101 Sectional',
    color: Colors.deepPurpleAccent,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
   
   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 20, 10,0,0),
    endTime: DateTime(2023, 6, 20, 12,0,0),
    subject: 'MA1521 Lecture',
    color: Colors.blueGrey,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 23, 10,0,0),
    endTime: DateTime(2023, 6, 23, 12,0,0),
    subject: 'MA1521 Lecture',
    color: Colors.blueGrey,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 21, 14,0,0),
    endTime: DateTime(2023, 6, 21, 15,0,0),
    subject: 'MA1521 Tutorial',
    color: Colors.blueGrey,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 20, 16,0,0),
    endTime: DateTime(2023, 6, 20, 18,0,0),
    subject: 'IS2218 Lecture',
    color: Colors.teal,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 19, 16, 0, 0),
    endTime: DateTime(2023, 6, 19, 18, 0, 0),
    subject: 'CS2040 Lecture',
    color: Colors.blueAccent,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 22, 12, 0, 0),
    endTime: DateTime(2023, 6, 22, 14, 0, 0),
    subject: 'CS2040 Lab',
    color: Colors.blueAccent,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 23, 15, 0, 0),
    endTime: DateTime(2023, 6, 23, 16, 0, 0),
    subject: 'CS2040 Tutorial',
    color: Colors.blueAccent,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

   meetings.add(Appointment(
    startTime: DateTime(2023, 6, 21, 13, 0, 0),
    endTime: DateTime(2023, 6, 21, 14, 0, 0),
    subject: 'CS2040 Lecture',
    color: Colors.blueAccent,
    recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
    return meetings;
  }

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}