import 'package:flutter/material.dart';
import 'module_timetable.dart';
import 'module.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.i});

  final int i;

  @override
  Widget build(BuildContext context) {
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
            child: Text(moduleList[i].description),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Workload - 10 hours',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
          const Padding(
              padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: 
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Grading Basis',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 1, 16, 8),
              child: Column(
                children: [
                  for (var item in moduleList[i].exam) (getExam(item))
                ],
              )),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: AddToTimetable(),
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

class AddToTimetable extends StatefulWidget {
  const AddToTimetable({super.key});

  @override
  State<AddToTimetable> createState() => AddToTimetableState();
}

class AddToTimetableState extends State<AddToTimetable> {
  bool _active = true;

  void _handleTap() {
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
