import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modrekt_who/misc/timetable_provider.dart';
import 'package:modrekt_who/widgets/slot_selection_popup.dart';

class PopUpWidget extends ConsumerStatefulWidget {
  const PopUpWidget({super.key, required this.title, required this.slotsList});

  final String title;
  final List<List<DateTime>> slotsList;

  @override
  ConsumerState<PopUpWidget> createState() {
    return _PopUpWidgetState();
  }
}

class _PopUpWidgetState extends ConsumerState<PopUpWidget> {
  void handleTap(int index) {
    final wasAdded = ref
        .watch(timetableProvider.notifier)
        .toggleTimetableStatus(widget.title, widget.slotsList[index]);
    _showDialog(wasAdded);
  }

  void _showDialog(bool wasAdded) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (ctx) => CupertinoAlertDialog(
          content: Text(wasAdded
              ? 'Module was added to timetable.'
              : 'Module was removed from timetable.'),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          content: Text(wasAdded
              ? 'Module was added to timetable.'
              : 'Module was removed from timetable.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, _) {
      ref.watch(timetableProvider.notifier);
      var listOfSlots = ref.watch(timetableProvider);
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
              0,
              20,
              0,
              0,
            ),
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary, fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.slotsList.length,
              itemBuilder: ((context, index) {
                var isActive =
                    listOfSlots.containsValue(widget.slotsList[index]);

                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '${formatter.format(widget.slotsList[index][0])} - ${formatter.format(
                            widget.slotsList[index][1],
                          )}',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            handleTap(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isActive
                                  ? const Color.fromARGB(255, 9, 43, 70)
                                  : const Color.fromARGB(255, 29, 72, 107),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                isActive
                                    ? 'Remove from Timetable'
                                    : 'Add to Timetable',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                  ],
                );
              }),
            ),
          ),
        ],
      );
    });
  }
}
