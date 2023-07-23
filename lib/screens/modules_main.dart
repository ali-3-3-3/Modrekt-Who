import 'package:flutter/material.dart';
import '../misc/module.dart';
import 'detail_page.dart';

class ModulesPage extends StatefulWidget {
  const ModulesPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  State<ModulesPage> createState() => _ModulesPageState();
}

class _ModulesPageState extends State<ModulesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Modules'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearchDelegate(),
                );
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: moduleList.length,
          itemBuilder: (context, index) {
            return Card(
                child: Column(children: [
              ListTile(
                  title: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(i: index)),
                  );
                },
                child: Column(
                  children: [
                    Text(moduleList[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        )),
                    Text(moduleList[index].faculty,
                        style: const TextStyle(
                          color: Colors.grey,
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 10, 2, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(moduleList[index].description,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  )),
                            ),
                          ],
                        )),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(2, 10.0, 2.0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Prerequisites',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 1, 8, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(moduleList[index].prerequisite,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  )),
                            )
                          ],
                        )),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 15.0, 2.0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Preclusions',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(2.0, 1, 2, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(moduleList[index].preclusion,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  )),
                            )
                          ],
                        )),
                    const Padding(
                        padding: EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0),
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
                        padding: const EdgeInsets.fromLTRB(2.0, 1, 2, 8),
                        child: Row(
                          children: [
                            for (var item in moduleList[index].workload)
                              (getSquare(item))
                          ],
                        ))
                  ],
                ),
              ))
            ]));
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
}

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

//clear search
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
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

//create results page
  @override
  Widget buildResults(BuildContext context) {
    List<String> searchResults = [];
    for (var modules in moduleList) {
      searchResults.add(modules.title);
    }
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          close(context, suggestions[index]);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                      i: searchResults
                          .indexWhere((item) => item == suggestions[index]))));
        },
        title: Text(suggestions[index]),
      ),
      itemCount: suggestions.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> searchResults = [];
    for (var modules in moduleList) {
      searchResults.add(modules.title);
    }
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          close(context, suggestions[index]);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                      i: searchResults
                          .indexWhere((item) => item == suggestions[index]))));
        },
        title: Text(suggestions[index]),
      ),
      itemCount: suggestions.length,
    );
  }
}
