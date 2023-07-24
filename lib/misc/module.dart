import 'package:flutter/material.dart';

class Module {
  String title;
  String faculty;
  String description;
  String prerequisite;
  String preclusion;
  List<String> exam;
  List<String> ticks;
  List<String> workload;
  List<List<DateTime>> lectureTime;
  List<List<DateTime>> tutorialTime;
  List<List<DateTime>> labTime;

  Module(
      this.title,
      this.faculty,
      this.description,
      this.prerequisite,
      this.preclusion,
      this.exam,
      this.ticks,
      this.workload,
      this.lectureTime,
      this.tutorialTime,
      this.labTime);
}

List<Module> moduleList = [
  Module(
    'CS1010S Programming Methodology',
    'Computer Science • 4 Units',
    'This course introduces the fundamental concepts of problem solving by computing and programming using an imperative programming language. It is the first and foremost introductory course to computing and is equivalent to CS1010 and CS1010E Programming Methodology. Topics covered include problem solving by computing, writing pseudo-codes, basic problem formulation and problem solving, program development, coding, testing and debugging, fundamental programming constructs (variables, types, expressions, assignments, functions, control structures, etc.), fundamental data structures: arrays, strings and structures, simple file processing, and basic recursion. This course is appropriate for FoS students.',
    'The prerequisite tree is now being improved to support the new (and more accurate) prerequisite information provided by NUS. It will be back soon!',
    'If undertaking an Undergraduate Degree THEN ( must not have completed 1 of CS1010/CS1010A/CS1010E/CS1010J/CS1010X/CS1101S at a grade of at least D)',
    [
      'Graded',
      'Semester 1 Exam',
      '27-Nov-2023 1:00 PM • 2 hrs',
      'Semester 2 Exam',
      '30-Apr-2024 1:00 PM • 2 hrs'
    ],
    ['SU', 'SEM1', 'SEM2'],
    [
      'Lec',
      'Lec',
      'Tut',
      'Lab',
      'Project',
      'Project',
      'Project',
      'Prep',
      'Prep',
      'Prep'
    ],
    [
      [DateTime(2023, 7, 20, 9, 0, 0), DateTime(2023, 7, 20, 11, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 20, 11, 0, 0), DateTime(2023, 7, 20, 13, 0, 0)],
      [DateTime(2023, 7, 20, 13, 0, 0), DateTime(2023, 7, 20, 15, 0, 0)],
      [DateTime(2023, 7, 20, 15, 0, 0), DateTime(2023, 7, 20, 17, 0, 0)],
      [DateTime(2023, 7, 21, 10, 0, 0), DateTime(2023, 7, 21, 12, 0, 0)],
      [DateTime(2023, 7, 21, 12, 0, 0), DateTime(2023, 7, 21, 14, 0, 0)],
      [DateTime(2023, 7, 21, 14, 0, 0), DateTime(2023, 7, 21, 16, 0, 0)],
      [DateTime(2023, 7, 21, 16, 0, 0), DateTime(2023, 7, 21, 18, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 20, 9, 0, 0), DateTime(2023, 7, 20, 9, 0, 0)]
    ],
  ),
  Module(
    'AC5001 Architectural History of Singapore',
    'Architecture • 4 Units',
    'This module introduces the architectural history of Singapore from the pre-colonial era to the contemporary period from an interdisciplinary perspective. It explores the social and cultural role of architects, and to how that role has been interpreted and has evolved. It also offers critical views on the role of architecture in constructing the national identity of Singapore.',
    'The prerequisite tree is now being improved to support the new (and more accurate) prerequisite information provided by NUS. It will be back soon!',
    ' - ',
    ['Graded', 'No Exam'],
    [],
    [
      'Lec',
      'Lec',
      'Tut',
      'Project',
      'Project',
      'Project',
      'Project',
      'Project',
      'Prep',
      'Prep'
    ],
    [
      [DateTime(2023, 7, 19, 14, 0, 0), DateTime(2023, 7, 19, 17, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 20, 9, 0, 0), DateTime(2023, 7, 20, 9, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 20, 9, 0, 0), DateTime(2023, 7, 20, 9, 0, 0)]
    ],
  ),
  Module(
    'BT1101 Introduction to Business Analytics',
    'Information Systems and Analytics • 4 Units',
    'This course provides students with an introduction to the fundamental concepts and tools needed to understand the emerging role of business analytics and data science applications in business and non-profit organisations. Students will learn how to apply basic business analytics and data science/analytics tools (such as R) to large real-life datasets in different contexts, and how to effectively use and interpret analytic models and results for making better and more well-informed business decisions. This course will provide both the organisational and technical aspects of business analytics and serves to provide students with a broad overview of how and why business analytics can be implemented in organisations, the various approaches and techniques that could be adopted for different organisational objectives and issues.',
    'The prerequisite tree is now being improved to support the new (and more accurate) prerequisite information provided by NUS. It will be back soon!',
    'If undertaking an Undergraduate Degree THEN ( must not have completed 1 of DSA1101/DSC1007/DSC1007X/DSE1101/EC2303/ST1131 at a grade of at least D)',
    [
      'Graded',
      'Semester 1 Exam',
      '30-Nov-2023 1:00 PM • 2.5 hrs',
      'Semester 2 Exam',
      '30-Apr-2024 5:00 PM • 2.5 hrs'
    ],
    ['SU', 'SEM1', 'SEM2'],
    [
      'Lec',
      'Lec',
      'Tut',
      'Lab',
      'Lab',
      'Project',
      'Project',
      'Prep',
      'Prep',
      'Prep'
    ],
    [
      [DateTime(2023, 7, 18, 12, 0, 0), DateTime(2023, 7, 18, 14, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 17, 10, 0, 0), DateTime(2023, 7, 17, 11, 0, 0)],
      [DateTime(2023, 7, 17, 11, 0, 0), DateTime(2023, 7, 17, 12, 0, 0)],
      [DateTime(2023, 7, 17, 12, 0, 0), DateTime(2023, 7, 17, 13, 0, 0)],
      [DateTime(2023, 7, 17, 13, 0, 0), DateTime(2023, 7, 17, 14, 0, 0)],
      [DateTime(2023, 7, 17, 14, 0, 0), DateTime(2023, 7, 17, 15, 0, 0)],
      [DateTime(2023, 7, 17, 9, 0, 0), DateTime(2023, 7, 17, 10, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 19, 8, 0, 0), DateTime(2023, 7, 19, 10, 0, 0)],
      [DateTime(2023, 7, 19, 10, 0, 0), DateTime(2023, 7, 19, 12, 0, 0)],
      [DateTime(2023, 7, 19, 12, 0, 0), DateTime(2023, 7, 19, 14, 0, 0)],
      [DateTime(2023, 7, 19, 14, 0, 0), DateTime(2023, 7, 19, 16, 0, 0)],
      [DateTime(2023, 7, 19, 16, 0, 0), DateTime(2023, 7, 19, 18, 0, 0)],
      [DateTime(2023, 7, 20, 8, 0, 0), DateTime(2023, 7, 20, 10, 0, 0)],
      [DateTime(2023, 7, 20, 10, 0, 0), DateTime(2023, 7, 20, 12, 0, 0)],
      [DateTime(2023, 7, 20, 12, 0, 0), DateTime(2023, 7, 20, 14, 0, 0)],
      [DateTime(2023, 7, 20, 14, 0, 0), DateTime(2023, 7, 20, 16, 0, 0)],
      [DateTime(2023, 7, 20, 16, 0, 0), DateTime(2023, 7, 20, 18, 0, 0)]
    ],
  ),
  Module(
    'MA1521 Calculus for Computing',
    'Mathematics • 4 Units',
    'This module provides a basic foundation for calculus and its related subjects required by computing students. The objective is to train the students to be able to handle calculus techniques arising in their courses of specialization. In addition to the standard calculus material, the course also covers simple mathematical modeling techniques and numerical methods in connection with ordinary differential equations. Major topics Preliminaries on sets and number systems. Calculus of functions of one variable and applications. Sequences, series and power series. Functions of several variables. Extrema. First and second order differential equations. Basic numerical methods for ordinary differential equations',
    'The prerequisite tree is now being improved to support the new (and more accurate) prerequisite information provided by NUS. It will be back soon!',
    'If undertaking an Undergraduate Degree THEN ( must not have completed 1 of MA1102R/MA1312/MA1505/MA1507/MA2002/MA2501/YSC1216 at a grade of at least D AND must not be undertaking 1 of 0601BMEHON Bachelor of Engineering (Biomedical Engineering) (Hons), 0602CHEHON Bachelor of Engineering (Chemical Engineering) (Hons), 0604ELEHON Bachelor of Engineering (Electrical Engineering) (Hons), 0605ESPHON Bachelor of Engineering (Engineering Science) (Hons), 0607ISEHON Bachelor of Engineering (Industrial and Systems Engineering) (Hons), 0608MSEHON Bachelor of Engineering (Materials Science and Engineering) (Hons), 0609MEHON Bachelor of Engineering (Mechanical Engineering) (Hons), 0611CHEHON Bachelor of Technology (Chemical Engineering) (Hons), 0611ELCHON Bachelor of Technology (Electronics Engineering) (Hons), 0611IMEHON Bachelor of Technology (Industrial & Mgt Engineering) (Hons), 0611MEHON Bachelor of Technology (Mechanical Engineering) (Hons), 0613CEHON Bachelor of Engineering (Civil Engineering) (Hons), 0613EVEHON Bachelor of Engineering (Environmental Engineering) (Hons), 2001CEGHON Bachelor of Engineering (Computer Engineering) (Hons), 1003MAHON Bachelor of Science - Mathematics (Hons), 1003APMHON Bachelor of Science - Applied Mathematics (Hons), 1003QFNHON Bachelor of Science - Quantitative Finance (Hons), 1006DSAHON Bachelor of Science (Data Science and Analytics) (Hons))',
    [
      'Graded',
      'Semester 1 Exam',
      '28-Nov-2023 9:00 AM • 2 hrs',
      'Semester 2 Exam',
      '02-May-2024 9:00 AM • 2 hrs'
    ],
    ['SU', 'SEM1', 'SEM2'],
    [
      'Lec',
      'Lec',
      'Lec',
      'Tut',
      'Prep',
      'Prep',
      'Prep',
      'Prep',
      'Prep',
      'Prep'
    ],
    [
      [DateTime(2023, 7, 17, 12, 0, 0), DateTime(2023, 7, 17, 13, 0, 0)],
      [DateTime(2023, 7, 17, 13, 0, 0), DateTime(2023, 7, 17, 14, 0, 0)],
      [DateTime(2023, 7, 17, 14, 0, 0), DateTime(2023, 7, 17, 15, 0, 0)],
      [DateTime(2023, 7, 17, 15, 0, 0), DateTime(2023, 7, 17, 16, 0, 0)],
      [DateTime(2023, 7, 17, 16, 0, 0), DateTime(2023, 7, 17, 17, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 18, 14, 0, 0), DateTime(2023, 7, 18, 15, 0, 0)],
      [DateTime(2023, 7, 18, 15, 0, 0), DateTime(2023, 7, 18, 16, 0, 0)],
      [DateTime(2023, 7, 18, 16, 0, 0), DateTime(2023, 7, 18, 17, 0, 0)],
      [DateTime(2023, 7, 18, 17, 0, 0), DateTime(2023, 7, 18, 18, 0, 0)],
      [DateTime(2023, 7, 19, 10, 0, 0), DateTime(2023, 7, 19, 11, 0, 0)],
      [DateTime(2023, 7, 19, 11, 0, 0), DateTime(2023, 7, 19, 12, 0, 0)],
      [DateTime(2023, 7, 19, 12, 0, 0), DateTime(2023, 7, 19, 13, 0, 0)],
      [DateTime(2023, 7, 19, 13, 0, 0), DateTime(2023, 7, 19, 14, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 20, 9, 0, 0), DateTime(2023, 7, 20, 9, 0, 0)]
    ],
  ),
  Module(
    'CS2040 Data Structures and Algorithms',
    'Computer Science • 4 Units',
    'This course introduces students to the design and implementation of fundamental data structures and algorithms. The course covers basic data structures (linked lists, stacks, queues, hash tables, binary heaps, trees, and graphs), searching and sorting algorithms, and basic analysis of algorithms.',
    'if undertaking an Undergraduate Degree then ( must have completed 1 of CS1010/CS1010E/CS1010J/CS1010S/CS1010X/CS1101S at a grade of at least D )',
    'if undertaking an Undergraduate Degree then ( must not have completed 1 of "CS1020"/"CS1020E"/"CS2010"/"CS2020"/CS2040C/CS2040S at a grade of at least D )',
    [
      'Graded',
      'Semester 1 Exam',
      '01-Dec-2023 2:30 PM • 2 hrs',
      'Semester 2 Exam',
      '03-May-2024 2:30 PM • 2 hrs'
    ],
    ['SEM1', 'SEM2'],
    [
      'Lec',
      'Lec',
      'Lec',
      'Lab',
      'Project',
      'Project',
      'Project',
      'Prep',
      'Prep',
      'Prep'
    ],
    [
      [DateTime(2023, 7, 19, 10, 0, 0), DateTime(2023, 7, 19, 12, 0, 0)],
      [DateTime(2023, 7, 20, 17, 0, 0), DateTime(2023, 7, 20, 18, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 20, 8, 0, 0), DateTime(2023, 7, 20, 9, 0, 0)],
      [DateTime(2023, 7, 20, 9, 0, 0), DateTime(2023, 7, 20, 10, 0, 0)],
      [DateTime(2023, 7, 20, 10, 0, 0), DateTime(2023, 7, 20, 11, 0, 0)],
      [DateTime(2023, 7, 20, 11, 0, 0), DateTime(2023, 7, 20, 12, 0, 0)],
      [DateTime(2023, 7, 20, 12, 0, 0), DateTime(2023, 7, 20, 13, 0, 0)],
      [DateTime(2023, 7, 20, 13, 0, 0), DateTime(2023, 7, 20, 14, 0, 0)],
      [DateTime(2023, 7, 20, 14, 0, 0), DateTime(2023, 7, 20, 15, 0, 0)],
      [DateTime(2023, 7, 20, 15, 0, 0), DateTime(2023, 7, 20, 16, 0, 0)],
      [DateTime(2023, 7, 20, 16, 0, 0), DateTime(2023, 7, 20, 17, 0, 0)],
      [DateTime(2023, 7, 20, 17, 0, 0), DateTime(2023, 7, 20, 18, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 21, 8, 0, 0), DateTime(2023, 7, 21, 10, 0, 0)],
      [DateTime(2023, 7, 21, 10, 0, 0), DateTime(2023, 7, 21, 12, 0, 0)],
      [DateTime(2023, 7, 21, 12, 0, 0), DateTime(2023, 7, 21, 14, 0, 0)],
      [DateTime(2023, 7, 21, 14, 0, 0), DateTime(2023, 7, 21, 16, 0, 0)],
      [DateTime(2023, 7, 21, 16, 0, 0), DateTime(2023, 7, 21, 18, 0, 0)]
    ],
  ),
  Module(
    'IS1108 Digital Ethics and Data Privacy',
    'Information Systems and Analytics • 4 Units',
    'Course is designed to introduce students to the issues of digital ethics and data privacy faced by individuals and organizations. It covers the ethical principles governing the behaviors and beliefs about how we use technology, and how we collect and process personal information in a manner that aligns with individual and organizational expectations for security and confidentiality. It will address challenges in balancing technological desirability with social desirability while developing digital products and services, including Professional Ethics, Computing for Social Good, Digital Ethics by Design, Digital Intellectual Property Rights, Automation and Autonomous Systems, and Artificial Intelligence Ethics and Governance.',
    'if undertaking an Undergraduate Degree then ( must have completed 1 of CS1010/CS1010E/CS1010J/CS1010S/CS1010X/CS1101S at a grade of at least D )',
    'If undertaking an Undergraduate Degree THEN must not have completed IS1103 at a grade of at least D',
    ['Graded', 'No Exam'],
    ['SU', 'SEM1', 'SEM2'],
    [
      'Lec',
      'Lec',
      'Tut',
      'Tut',
      'Project',
      'Project',
      'Prep',
      'Project',
      'Prep',
      'Prep'
    ],
    [
      [DateTime(2023, 7, 20, 9, 0, 0), DateTime(2023, 7, 20, 12, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 18, 9, 0, 0), DateTime(2023, 7, 18, 11, 0, 0)],
      [DateTime(2023, 7, 18, 11, 0, 0), DateTime(2023, 7, 18, 13, 0, 0)],
      [DateTime(2023, 7, 18, 13, 0, 0), DateTime(2023, 7, 18, 15, 0, 0)],
      [DateTime(2023, 7, 18, 15, 0, 0), DateTime(2023, 7, 18, 17, 0, 0)],
      [DateTime(2023, 7, 19, 9, 0, 0), DateTime(2023, 7, 19, 11, 0, 0)],
      [DateTime(2023, 7, 19, 11, 0, 0), DateTime(2023, 7, 19, 13, 0, 0)],
      [DateTime(2023, 7, 19, 13, 0, 0), DateTime(2023, 7, 19, 15, 0, 0)],
      [DateTime(2023, 7, 19, 15, 0, 0), DateTime(2023, 7, 19, 17, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 20, 9, 0, 0), DateTime(2023, 7, 20, 9, 0, 0)]
    ],
  ),
  Module(
    'CS2030S Programming Methodology II',
    'Computer Science • 4 Units',
    'This course is a follow up to CS1010. It explores two modern programming paradigms, object-oriented programming and functional programming. Through a series of integrated assignments, students will learn to develop medium-scale software programs in the order of thousands of lines of code and tens of classes using object-oriented design principles and advanced programming constructs available in the two paradigms. Topics include objects and classes, composition, association, inheritance, interface, polymorphism, abstract classes, dynamic binding, lambda expression, effect-free programming, first class functions, closures, continuations, monad, etc.',
    'if undertaking an Undergraduate Degree then ( must have completed 1 of CS1010/CS1010E/CS1010J/CS1010S/CS1010X/CS1101S at a grade of at least D )',
    'if undertaking an Undergraduate Degree then ( must not have completed 1 of "CS1020"/"CS1020E"/"CS2020" at a grade of at least D and must not have completed CS2030 at a grade of at least D )',
    [
      'Graded',
      'Semester 1 Exam',
      '04-Dec-2023 9:00 AM • 2 hrs',
      'Semester 2 Exam',
      '02-May-2024 1:00 PM • 2 hrs'
    ],
    ['SEM1', 'SEM2'],
    [
      'Lec',
      'Lec',
      'Tut',
      'Lab',
      'Lab',
      'Project',
      'Project',
      'Project',
      'Prep',
      'Prep'
    ],
    [
      [DateTime(2023, 7, 19, 14, 0, 0), DateTime(2023, 7, 19, 16, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 17, 12, 0, 0), DateTime(2023, 7, 17, 13, 0, 0)],
      [DateTime(2023, 7, 17, 13, 0, 0), DateTime(2023, 7, 17, 14, 0, 0)],
      [DateTime(2023, 7, 17, 14, 0, 0), DateTime(2023, 7, 17, 15, 0, 0)],
      [DateTime(2023, 7, 17, 15, 0, 0), DateTime(2023, 7, 17, 16, 0, 0)],
      [DateTime(2023, 7, 17, 16, 0, 0), DateTime(2023, 7, 17, 17, 0, 0)]
    ],
    [
      [DateTime(2023, 7, 18, 14, 0, 0), DateTime(2023, 7, 18, 15, 0, 0)],
      [DateTime(2023, 7, 18, 15, 0, 0), DateTime(2023, 7, 18, 16, 0, 0)],
      [DateTime(2023, 7, 18, 16, 0, 0), DateTime(2023, 7, 18, 17, 0, 0)],
      [DateTime(2023, 7, 18, 17, 0, 0), DateTime(2023, 7, 18, 18, 0, 0)],
      [DateTime(2023, 7, 19, 10, 0, 0), DateTime(2023, 7, 19, 11, 0, 0)],
      [DateTime(2023, 7, 19, 11, 0, 0), DateTime(2023, 7, 19, 12, 0, 0)],
      [DateTime(2023, 7, 19, 12, 0, 0), DateTime(2023, 7, 19, 13, 0, 0)],
      [DateTime(2023, 7, 19, 13, 0, 0), DateTime(2023, 7, 19, 14, 0, 0)]
    ],
  )
];

getTick(String checker, BuildContext context) {
  switch (checker) {
    case 'SU':
      return Row(
        children: [
          const Icon(Icons.check, color: Colors.green),
          Text(
            "Has S/U option for Undergraduate students only",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          )
        ],
      );
    case 'SEM1':
      return Row(
        children: [
          const Icon(Icons.check, color: Colors.green),
          Text(
            "Included in Semester 1's Course Planning Exercise",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          )
        ],
      );
    case 'SEM2':
      return Row(
        children: [
          const Icon(Icons.check, color: Colors.green),
          Text(
            "Included in Semester 2's Course Planning Exercise",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          )
        ],
      );
    case 'Additional Information':
      return Row(
        children: [
          Text(checker,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ))
        ],
      );
  }
}

getSquare(String condition) {
  switch (condition) {
    case 'Prep':
      return Icon(Icons.rectangle_rounded, color: Colors.blue[500]);
    case 'Tut':
      return Icon(Icons.rectangle_rounded, color: Colors.red[500]);
    case 'Lab':
      return Icon(Icons.rectangle_rounded, color: Colors.green[500]);
    case 'Project':
      return Icon(Icons.rectangle_rounded, color: Colors.amber[500]);
    case 'Lec':
      return Icon(Icons.rectangle_rounded, color: Colors.purple[500]);
  }
}

getExam(String cond, BuildContext context) {
  switch (cond) {
    case 'Semester 1 Exam':
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          cond,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      );
    case 'Semester 2 Exam':
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          cond,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      );
    default:
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          cond,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onBackground,
          ),
        ),
      );
  }
}
