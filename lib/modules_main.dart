import 'package:flutter/material.dart';
import 'detailOne.dart';
import 'specifics.dart';
import 'detailTwo.dart';
import 'detailThree.dart';
import 'detailFour.dart';
import 'detailFive.dart'; 
import 'detailSix.dart';
import 'detailSeven.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 @override
 Widget build(BuildContext context) {
 return const MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Material App',
  home: HomeScreen(),
 );
 }
}

class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);
 @override
 // ignore: library_private_types_in_public_api
 _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar:  AppBar(
      title: const Text('Modules'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: MySearchDelegate(),
            );
          },
        ),
      ],
    ),
    body: ListView(
          children: [
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailOne(title: 'AC5001 Architectural History of Singapore');
              }));
            },
            child: moduleOne,
            ),
            completeWorkLoad,
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailTwo(title: 'CS1010S Programming Methodology');
              }));
            },
            child: moduleTwo,
            ),
            completeWorkLoadTwo,
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailThree(title: 'BT1101 Introduction to Business Analytics');
              }));
            },
            child: moduleThree,
            ),
            completeWorkLoad,
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailFour(title: 'MA1521 Calculus for Computing');
              }));
            },
            child: moduleFour,
            ),
            completeWorkLoadTwo,
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailFive(title: 'CS2040 Data Structures and Algorithms');
              }));
            },
            child: moduleFive,
            ),
            completeWorkLoad,
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailSix(title: 'IS1108 Digital Ethics and Data Privacy');
              }));
            },
            child: moduleSix,
            ),
            completeWorkLoad,
            TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailSeven(title: 'CS2030S Programming Methodology II');
              }));
            },
            child: moduleSeven,
            ),
            completeWorkLoadTwo,
          ],
        ),
      );
  }
final List<String> searchResults = [
    'AC5001',
    'CS1010S',
    'BT1101',
    'MA1521',
    'CS2040',
    'IS1108',
    'CS2030S',
];


class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    onPressed: () => close(context, null),
    icon: const Icon(Icons.arrow_back),
  );

  @override
  List<Widget>? buildActions(BuildContext context) => [IconButton(
    icon: const Icon(Icons.clear),
    onPressed: () {
      if (query.isEmpty) {
        close(context, null);
      } else {
      query = '';
      }
    },
  ),
  ];

  @override
  Widget buildResults(BuildContext context) {
  List<String> suggestions = searchResults.where((searchResult) {
    final result = searchResult.toLowerCase();
    final input = query.toLowerCase();
    return result.contains(input);
  }).toList();
  return ListView.builder(
    itemBuilder: (context, index) => ListTile(
      onTap: () {
        close(context, suggestions[index]);
        Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => DetailScreen(searchResults
          .indexWhere((item) => item == suggestions[index]))));
      },
      title: Text(suggestions[index]),
    ),
    itemCount: suggestions.length,
  );
}

  @override
Widget buildSuggestions(BuildContext context) {
  List<String> suggestions = searchResults.where((searchResult) {
    final result = searchResult.toLowerCase();
    final input = query.toLowerCase();
    return result.contains(input);
  }).toList();
  return ListView.builder(
    itemBuilder: (context, index) => ListTile(
      onTap: () {
        close(context, suggestions[index]);
        Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => DetailScreen(searchResults
          .indexWhere((item) => item == suggestions[index]))));
      },
      title: Text(suggestions[index]),
    ),
    itemCount: suggestions.length,
  );
}
}

class DetailScreen extends StatelessWidget { 
  final int index;
  const DetailScreen(this.index, {super.key});
  @override
  Widget build(BuildContext context) {
final List<TextButton> buttonsList = [
  TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailOne(title: 'AC5001 Architectural History of Singapore');
              }));
            },
            child: moduleOne,
            ),
  TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailTwo(title: 'CS1010S Programming Methodology');
              }));
            },
            child: moduleTwo,
            ),
  TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailThree(title: 'BT1101 Introduction to Business Analytics');
              }));
            },
            child: moduleThree,
            ),
  TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailFour(title: 'MA1521 Calculus for Computing');
              }));
            },
            child: moduleFour,
            ),
  TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailFive(title: 'CS2040 Data Structures and Algorithms');
              }));
            },
            child: moduleFive,
            ),
  TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailSix(title: 'IS1108 Digital Ethics and Data Privacy');
              }));
            },
            child: moduleSix,
            ),
  TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DetailSeven(title: 'CS2030S Programming Methodology II');
              }));
            },
            child: moduleSeven,
            )
];
    return Scaffold(
      appBar: AppBar(title: Text(searchResults[index]),),
        body: buttonsList[index],
    );
  }
}
