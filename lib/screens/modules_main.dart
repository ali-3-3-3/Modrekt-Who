import 'package:flutter/material.dart';
import 'package:modrekt_who/misc/module_item.dart';
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
          title: const Text(
            'Modules',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
            return ModuleItem(index: index);
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
