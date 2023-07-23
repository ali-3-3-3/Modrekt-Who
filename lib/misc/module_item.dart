import 'package:flutter/material.dart';
import 'package:modrekt_who/misc/module.dart';
import 'package:modrekt_who/screens/detail_page.dart';

class ModuleItem extends StatelessWidget {
  final int index;

  const ModuleItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).cardColor,
        child: Column(children: [
          ListTile(
              title: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage(i: index)),
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
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              )),
                        ),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(2, 10.0, 2.0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Prerequisites',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 1, 8, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(moduleList[index].prerequisite,
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              )),
                        )
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 15.0, 2.0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Preclusions',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 1, 2, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(moduleList[index].preclusion,
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              )),
                        )
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Workload - 10 hours',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
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
  }
}
