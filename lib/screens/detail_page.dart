import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modrekt_who/misc/list_of_modules_provider.dart';
import '../misc/module_timetable.dart';
import '../misc/module.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(moduleList[i].title),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(moduleList[i].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    )),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 5, 16, 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(moduleList[i].faculty,
                    style: const TextStyle(
                      color: Colors.grey,
                    )),
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 10, 16, 10),
            child: Text(
              moduleList[i].description,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Workload - 10 hours',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 1, 16, 8),
              child: Row(
                children: [
                  for (var item in moduleList[i].workload) (getSquare(item))
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Grading Basis',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 1, 16, 8),
              child: Column(
                children: [
                  for (var item in moduleList[i].exam) (getExam(item, context))
                ],
              )),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
            child: AddToTimetable(
              i: i,
            ),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Timetable',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ModuleTimetable(x: i);
                  }));
                },
                child: Container(
                  width: 500,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "View Module Timetable",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 1, 16, 8),
              child: Column(
                children: [
                  for (var item in moduleList[i].ticks) (getTick(item))
                ],
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 2, 16, 8),
              child: Column(children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Prerequisite Tree',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //prerequisites
                Text(moduleList[i].prerequisite),
              ])),
        ]),
      ),
    );
  }
}

class AddToTimetable extends ConsumerStatefulWidget {
  const AddToTimetable({super.key, required this.i});

  final int i;

  @override
  ConsumerState<AddToTimetable> createState() => _AddToTimetableState();
}

class _AddToTimetableState extends ConsumerState<AddToTimetable> {
  bool _active = true;

  void _handleTap() {
    final wasAdded = ref
        .read(listOfModulesProvider.notifier)
        .toggleAddedModuleStatus(moduleList[widget.i]);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(wasAdded
            ? 'Module was added to timetable.'
            : 'Module was removed from timetable.'),
      ),
    );
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _active ? Colors.blue[500] : Colors.blue[300],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _active ? 'Add to Timetable' : 'Remove from Timetable',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
