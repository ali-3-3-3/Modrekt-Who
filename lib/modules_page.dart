import 'package:flutter/material.dart';

import 'package:modrekt_who/details_page.dart';
//import 'package:csv/csv.dart';

class ModulesPage extends StatefulWidget {
  const ModulesPage({Key? key}) : super(key: key);

  @override
  State<ModulesPage> createState() => _ModulesPageState();
}

class _ModulesPageState extends State<ModulesPage> {
  //Future feaature: Able to read from a csvfile of data

  //List<List<dynamic>> listData =
  //const CsvToListConverter().convert("assets/modules.csv");

  @override
  Widget build(BuildContext context) {
    List<String> moduleName = [
      'CS2030 Programming Methodology II',
      'CS2040 Data Structures and Algorithms',
      'IS2101 Business and Technical Communication',
      'IS2218 Digital Platforms for Business',
      'MA1521 Calculus for Computing'
    ];

    List<String> faculty = [
      'Computer Science',
      'Computer Science',
      'Center for Engl Lang Comms',
      'Information Systems and Analytics',
      'Mathematics'
    ];

    List<String> description = [
      'This course is a follow up to CS1010. It explores two modern programming paradigms, object-oriented programming and functional programming. Through a series of integrated assignments, students will learn to develop medium-scale software programs in the order of thousands of lines of code and tens of classes using object oriented design principles and advanced programming constructs available in the two paradigms. Topics include objects and classes, composition, association, inheritance, interface, polymorphism, abstract classes, dynamic binding, lambda expression, effect-free programming, first class functions, closures, continuations, monad, etc.',
      'This course introduces students to the design and implementation of fundamental data structures and algorithms. The course covers basic data structures (linked lists, stacks, queues, hash tables, binary heaps, trees, and graphs), searching and sorting algorithms, and basic analysis of algorithms.',
      'IS2101 (Business and Technical Communication) a customized core course for the School of Computing, aims to give its students a professional edge in the competitive and interconnected job market by preparing and enhancing their professional communication skills in IT related work settings. This is a 48-hour course taught over 12 weeks with a three-hour tutorial and a one-hour online lecture + related activities per week.',
      'Digital platforms underlie nearly all modern industries and businesses. Their interconnected ecosystems radically transform the way we work, shop, transact, socialize and travel. This course aims to introduce the phenomena of digital platforms for businesses and the associated business fundamentals, concepts and models that underlie and support the business and value propositions of these platforms. Specifically, students will learn about different digital marketing and retailing platforms (e.g., Google, Amazon), fintech platforms (e.g., Binance, Alipay), and logistics/delivery platforms (e.g., NinjaVan, Deliveroo), as well as basic marketing, finance and operations management concepts.',
      'This module provides a basic foundation for calculus and its related subjects required by computing students. The objective is to train the students to be able to handle calculus techniques arising in their courses of specialization. In addition to the standard calculus material, the course also covers simple mathematical modeling techniques and numerical methods in connection with ordinary differential equations. Major topics Preliminaries on sets and number systems. Calculus of functions of one variable and applications. Sequences, series and power series. Functions of several variables. Extrema. First and second order differential equations. Basic numerical methods for ordinary differential equations.'
    ];

    List<String> preclusions = [
      'if undertaking an Undergraduate Degree then (must not have completed 1 of "CS1020"/"CS1020E"/"CS2020" at a grade of at least D and must not have completed CS2030S at a grade of at least D)',
      'if undertaking an Undergraduate Degree then (must not have completed 1 of "CS1020"/"CS1020E"/"CS2010"/"CS2020"/CS2040C/CS2040S at a grade of at least D)',
      'If undertaking an Undergraduate Degree THEN must not have completed 1 of CS2101, CS2103T, ES2002, ES2007D, IS2101 at a grade of at least D',
      'NA',
      'If undertaking an Undergraduate Degree THEN ( must not have completed 1 of MA1102R/MA1312/MA1505/MA1507/MA2002/MA2501/YSC1216 at a grade of at least D AND must not be undertaking 1 of 0601BMEHON Bachelor of Engineering (Biomedical Engineering) (Hons), 0602CHEHON Bachelor of Engineering (Chemical Engineering) (Hons), 0604ELEHON Bachelor of Engineering (Electrical Engineering) (Hons), 0605ESPHON Bachelor of Engineering (Engineering Science) (Hons), 0607ISEHON Bachelor of Engineering (Industrial and Systems Engineering) (Hons), 0608MSEHON Bachelor of Engineering (Materials Science and Engineering) (Hons), 0609MEHON Bachelor of Engineering (Mechanical Engineering) (Hons), 0611CHEHON Bachelor of Technology (Chemical Engineering) (Hons), 0611ELCHON Bachelor of Technology (Electronics Engineering) (Hons), 0611IMEHON Bachelor of Technology (Industrial & Mgt Engineering) (Hons), 0611MEHON Bachelor of Technology (Mechanical Engineering) (Hons), 0613CEHON Bachelor of Engineering (Civil Engineering) (Hons), 0613EVEHON Bachelor of Engineering (Environmental Engineering) (Hons), 2001CEGHON Bachelor of Engineering (Computer Engineering) (Hons), 1003MAHON Bachelor of Science - Mathematics (Hons), 1003APMHON Bachelor of Science - Applied Mathematics (Hons), 1003QFNHON Bachelor of Science - Quantitative Finance (Hons), 1006DSAHON Bachelor of Science (Data Science and Analytics) (Hons))'
    ];

    List<String> prerequisites = [
      'if undertaking an Undergraduate Degree then (must have completed 1 of CS1010/CS1010E/CS1010J/CS1010S/CS1010X/CS1101S at a grade of at least D)',
      'if undertaking an Undergraduate Degree then (must have completed 1 of CS1010/CS1010E/CS1010J/CS1010S/CS1010X/CS1101S at a grade of at least D)',
      'If undertaking an Undergraduate Degree THEN (must have completed EP ENGLISH LANGUAGE PROFICIENCY TEST at a grade of at least N)',
      'NA',
      'If undertaking an Undergraduate Degree THEN ( must have completed 1 of 06 MATHEMATICS/07 FURTHER MATHEMATICS/21 PURE MATHEMATICS/22 APPLIED MATHEMATICS at a grade of at least E OR must have completed 1 of MA1301/MA1301X at a grade of at least D)'
    ];

    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                ListTile(
                  title: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsPage(i: index)),
                      );
                    },
                    child: Text(moduleName[index]),
                  ),
                  subtitle: Text('${faculty[index]} - 4 units'),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('Description: ${description[index]}'),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text('Preclusions: ${preclusions[index]}'),
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text('Prerequisites: ${prerequisites[index]}'),
                        ),
                      ],
                    ))
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
