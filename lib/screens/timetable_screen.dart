import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modrekt_who/misc/list_of_modules_provider.dart';
import 'package:modrekt_who/widgets/slot_selection_popup.dart';
import 'package:modrekt_who/misc/timetable_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math';

class Timetable extends ConsumerStatefulWidget {
  const Timetable({super.key});

  @override
  ConsumerState<Timetable> createState() => _TimetableState();
}

class _TimetableState extends ConsumerState<Timetable> {
  @override
  Widget build(BuildContext context) {
    var listOfModules = ref.watch(listOfModulesProvider);

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
                dataSource: MeetingDataSource(
                  getAppointments(ref),
                ),
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
                          .toggleAddedModuleStatus(listOfModules[index]);
                      ref.read(timetableProvider.notifier).deleteSlots(
                            listOfModules[index],
                          );
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
                    child: Card(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      child: ListTile(
                        dense: true,
                        visualDensity: const VisualDensity(vertical: -4),
                        title: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SlotSelectionPopUp(
                                    module: listOfModules[index]),
                              ),
                            );
                          },
                          child: Text(
                            '${index + 1}. ${listOfModules[index].title}',
                            style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
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

List<Appointment> getAppointments(WidgetRef ref) {
  List<Appointment> meetings = <Appointment>[];
  var listOfSlots = ref.watch(timetableProvider);

  for (var slot in listOfSlots.values) {
    meetings.add(Appointment(
        startTime: slot.first,
        endTime: slot.last,
        subject: listOfSlots.keys.firstWhere((k) => listOfSlots[k] == slot),
        color:
            Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
        recurrenceRule: 'FREQ=DAILY;INTERVAL=7;COUNT=10'));
  }
  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }
}
