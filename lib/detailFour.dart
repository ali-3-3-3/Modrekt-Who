// ignore: file_names
import 'package:flutter/material.dart';
import 'specifics.dart';
import 'moduletimetabletwo.dart';

class DetailFour extends StatelessWidget {
  const DetailFour({Key? key, required this.title}) : super(key:key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
          children: [
            moduleFour,
            completeWorkLoadTwo,
            haveExam,
            const TapboxA(),
            const Text(
                'Preclusions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
              ),
              const Text('If undertaking an Undergraduate Degree THEN ( must not have completed 1 of MA1102R/MA1312/MA1505/MA1507/MA2002/MA2501/YSC1216 at a grade of at least D AND must not be undertaking 1 of 0601BMEHON Bachelor of Engineering (Biomedical Engineering) (Hons), 0602CHEHON Bachelor of Engineering (Chemical Engineering) (Hons)',
              ),
            extraInfo,
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
              ),
            const Text(
                'Prerequisite',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
              ),
              const Text('If undertaking an Undergraduate Degree THEN ( must have completed 1 of 06 MATHEMATICS/07 FURTHER MATHEMATICS/21 PURE MATHEMATICS/22 APPLIED MATHEMATICS at a grade of at least E OR must have completed 1 of MA1301/MA1301X at a grade of at least D)',
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