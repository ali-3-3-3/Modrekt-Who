import 'package:flutter/material.dart';
import 'specifics.dart';
import 'moduletimetable.dart';

class DetailOne extends StatelessWidget {
  const DetailOne({Key? key, required this.title}) : super(key:key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
          children: [
            moduleOne,
            completeWorkLoad,
            noExam,
            const TapboxA(),
            prereq,
            timetableWording,
            GestureDetector(
              onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const Timetable(title: 'View Timetable');
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
              )
          ], 
          
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