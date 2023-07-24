import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modrekt_who/misc/module.dart';

class TimetableNotifier extends StateNotifier<Map<String, List<DateTime>>> {
  TimetableNotifier() : super({});

  bool toggleTimetableStatus(String string, List<DateTime> list) {
    final timetable = state.containsValue(list);
    var newMap = state;

    if (timetable) {
      newMap.remove(string);
      state = newMap;
      return false;
    } else {
      newMap[string] = list;
      state = newMap;
      return true;
    }
  }

  void deleteSlots(Module module) {
    List<String> toRemove = [];
    var newMap = state;
    state.forEach((key, value) {
      if (key.contains(
        '${module.title} LEC',
      )) {
        toRemove.add(key);
      }
      if (key.contains(
        '${module.title} TUT',
      )) {
        toRemove.add(key);
      }
      if (key.contains(
        '${module.title} LAB',
      )) {
        toRemove.add(key);
      }
    });
    newMap.removeWhere((key, value) => toRemove.contains(key));
    state = newMap;
  }
}

final timetableProvider =
    StateNotifierProvider<TimetableNotifier, Map<String, List<DateTime>>>(
  (ref) => TimetableNotifier(),
);

class TimeNotifier extends StateNotifier<int> {
  TimeNotifier() : super(0);

  void toggleTimeStatus(int i) {
    state = i;
  }
}

final timeProvider = StateNotifierProvider<TimeNotifier, int>(
  (ref) => TimeNotifier(),
);
