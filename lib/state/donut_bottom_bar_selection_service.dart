import 'package:flutter/material.dart';
import 'package:donuts_minishop/utils.dart';

class DonutBottomBarSelectionService extends ChangeNotifier {
  String? tabSelection = 'main';

  /// When a user calls Utils.mainListNav.currentState.pushNamed()
  /// and pass the named route belonging to this child navigation stack, the onGenerateRoute gets invoked
  void setTabSelection(String newSelection) {
    Utils.mainListNav.currentState?.pushReplacementNamed('/' + newSelection);
    
    tabSelection = newSelection;
    notifyListeners();
  }
}
