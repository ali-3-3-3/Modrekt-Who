import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modrekt_who/misc/list_of_modules_provider.dart';
import 'package:modrekt_who/misc/module.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Timetable extends ConsumerStatefulWidget {
  const Timetable({super.key});

  @override
  ConsumerState<Timetable> createState() => _TimetableState();
}

class _TimetableState extends ConsumerState<Timetable> {
  @override
  Widget build(BuildContext context) {
    final listOfModules = ref.watch(listOfModulesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Timetable',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SfCalendar(
                view: CalendarView.workWeek,
                firstDayOfWeek: 1,
                timeSlotViewSettings: const TimeSlotViewSettings(
                    startHour: 9,
                    endHour: 21,
                    nonWorkingDays: <int>[DateTime.saturday, DateTime.sunday]),
                dataSource: MeetingDataSource(getAppointments()),
              ),
            ),
          ),
          if (listOfModules.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: listOfModules.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(listOfModules[index]),
                    onDismissed: (direction) {
                      ref
                          .read(listOfModulesProvider.notifier)
                          .toggleAddedModuleStatus(moduleList[index]);
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Module was removed from timetable.',
                          ),
                          duration: Duration(milliseconds: 200),
                        ),
                      );
                    },
                    background: Container(
                      color:
                          Theme.of(context).colorScheme.error.withOpacity(0.5),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${index + 1}. ${listOfModules[index].title}',
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

List<Appointment> getAppointments() {
  List<Appointment> meetings = <Appointment>[];
  final DateTime today = DateTime.now();
  final DateTime startTime =
      DateTime(today.year, today.month, today.day, 9, 0, 0);
  // ignore: unused_local_variable
  final DateTime endTime = startTime.add(const Duration(hours: 2));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 19, 12, 0, 0),
      endTime: DateTime(2023, 6, 19, 14, 0, 0),
      subject: 'CS2030 Lecture',
      color: Colors.pinkAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 21, 12, 0, 0),
      endTime: DateTime(2023, 6, 21, 13, 0, 0),
      subject: 'CS2030 Recitation',
      color: Colors.pinkAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 23, 12, 0, 0),
      endTime: DateTime(2023, 6, 23, 14, 0, 0),
      subject: 'CS2030 Lab',
      color: Colors.pinkAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 19, 9, 0, 0),
      endTime: DateTime(2023, 6, 19, 12, 0, 0),
      subject: 'IS2101 Sectional',
      color: Colors.deepPurpleAccent,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 20, 10, 0, 0),
      endTime: DateTime(2023, 6, 20, 12, 0, 0),
      subject: 'MA1521 Lecture',
      color: Colors.blueGrey,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 23, 10, 0, 0),
      endTime: DateTime(2023, 6, 23, 12, 0, 0),
      subject: 'MA1521 Lecture',
      color: Colors.blueGrey,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 21, 14, 0, 0),
      endTime: DateTime(2023, 6, 21, 15, 0, 0),
      subject: 'MA1521 Tutorial',
      color: Colors.blueGrey,
      recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));

  meetings.add(Appointment(
      startTime: DateTime(2023, 6, 20, 16, 0, 0),
      endTime: DateTime(2023, 6, 20, 18, 0, 0),
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
