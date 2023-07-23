import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modrekt_who/misc/module.dart';

class ListOfModulesNotifier extends StateNotifier<List<Module>> {
  ListOfModulesNotifier() : super([]);

  bool toggleAddedModuleStatus(Module module) {
    final moduleAdded = state.contains(module);
    if (moduleAdded) {
      state = state.where((m) => m.title != module.title).toList();
      return false;
    } else {
      state = [...state, module];
      return true;
    }
  }
}

final listOfModulesProvider =
    StateNotifierProvider<ListOfModulesNotifier, List<Module>>(
  (ref) => ListOfModulesNotifier(),
);
