import 'package:modrekt_who/misc/module.dart';
import 'package:modrekt_who/misc/timetable_provider.dart';
import 'package:modrekt_who/widgets/popup_widget.dart';
import 'package:xen_popup_card/xen_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.jm();

class SlotSelectionPopUp extends ConsumerWidget {
  const SlotSelectionPopUp({super.key, required this.module});

  final Module module;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int i = ref.watch(timeProvider);
    return XenPopupCard(
        cardBgColor: Theme.of(context).colorScheme.background,
        appBar: XenCardAppBar(
          color: Theme.of(context).colorScheme.secondaryContainer,
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
              ),
              const CustomButton(text: 'LECTURE'),
              const SizedBox(width: 8),
              const CustomButton(text: 'TUTORIAL'),
              const SizedBox(width: 8),
              const CustomButton(text: 'LAB'),
            ],
          ),
        ),
        body: switch (i) {
          1 => PopUpWidget(
              title: '${module.title} LEC',
              slotsList: module.lectureTime,
            ),
          2 => PopUpWidget(
              title: '${module.title} TUT',
              slotsList: module.tutorialTime,
            ),
          3 => PopUpWidget(
              title: '${module.title} LAB',
              slotsList: module.labTime,
            ),
          _ => PopUpWidget(
              title: '${module.title} LEC',
              slotsList: module.lectureTime,
            ),
        });
  }
}

class CustomButton extends ConsumerWidget {
  const CustomButton({Key? key, required this.text, this.color})
      : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (text == 'LECTURE') {
          ref.read(timeProvider.notifier).toggleTimeStatus(1);
        } else if (text == 'TUTORIAL') {
          ref.read(timeProvider.notifier).toggleTimeStatus(2);
        } else if (text == 'LAB') {
          ref.read(timeProvider.notifier).toggleTimeStatus(3);
        }
      },
      child: Material(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
