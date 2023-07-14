// ignore: file_names
import 'package:flutter/material.dart';
import 'specifics.dart';
import 'moduletimetablethree.dart';

class DetailSeven extends StatelessWidget {
  const DetailSeven({Key? key, required this.title}) : super(key:key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
          children: [
            moduleFive,
            completeWorkLoad,
            haveExam,
            const TapboxA(),
            const Text(
                'Preclusion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
              ),
              const Text('if undertaking an Undergraduate Degree then ( must not have completed 1 of "CS1020"/"CS1020E"/"CS2020" at a grade of at least D and must not have completed CS2030 at a grade of at least D )'
              ),
            extraInfoNoSU,
            timetableWording,
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Timetable(title: 'View Module Timetable');
              }));
            },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("View Module Timetable",textAlign: TextAlign.center,),
                  ),
                ),
              ), const Text(
                'Prerequisite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
              ),
              const Text('if undertaking an Undergraduate Degree then ( must have completed 1 of CS1010/CS1010E/CS1010J/CS1010S/CS1010X/CS1101S at a grade of at least D )'
              ),
          ]
      )
    );
  }
}


class TapboxA extends StatefulWidget {
  const TapboxA({super.key});

  @override
  State<TapboxA> createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
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
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _active ? Colors.blue[500] : Colors.blue[300],
        ), 
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
            child: Text(
              _active ? 'Add to Timetable' : 'Remove from Timetable',
              textAlign: TextAlign.center,),
                  ),
        ),
        );
  }}