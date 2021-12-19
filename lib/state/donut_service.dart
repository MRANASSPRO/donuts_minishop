import 'package:donuts_minishop/models/donut_filter_bar_item.dart';
import 'package:donuts_minishop/models/donut_product.dart';
import 'package:donuts_minishop/utils.dart';
import 'package:flutter/material.dart';

class DonutService extends ChangeNotifier {
  List<DonutFilterBarItem> filterBarItems = [
    DonutFilterBarItem(id: 1, label: 'Classic'),
    DonutFilterBarItem(id: 2, label: 'Sprinkled'),
    DonutFilterBarItem(id: 3, label: 'Stuffed'),
  ];

  String? selectedDonutType;
  List<DonutProduct> filteredDonuts = [];
  late DonutProduct selectedDonut;

  DonutService() {
    selectedDonutType = filterBarItems.first.label;
    filterDonutsByType(selectedDonutType!);
  }

  /// getter for the selectedDonut property
  DonutProduct getSelectedDonut() {
    return selectedDonut;
  }

  /// encapsulate the navigation to the details page
  void onDonutSelected(DonutProduct donut) {
    selectedDonut = donut;
    Utils.mainAppNav.currentState!.pushNamed('/details');
  }

  /// filter donuts to trigger a widget rebuild in the event that the selectedDonutType has changed
  void filterDonutsByType(String type) {
    selectedDonutType = type;
    filteredDonuts = Utils.donuts
        .where((donutElement) => donutElement.type == selectedDonutType)
        .toList();
    notifyListeners();
  }
}
