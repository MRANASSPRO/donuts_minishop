import 'package:donuts_minishop/models/donut_filter_bar_item.dart';
import 'package:donuts_minishop/state/donut_service.dart';
import 'package:donuts_minishop/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutFilterBar extends StatelessWidget {
  const DonutFilterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<DonutService>(
          builder: (context, donutService, child) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(donutService.filterBarItems.length, (index) {
                    /// return each filter bar item
                    DonutFilterBarItem item = donutService.filterBarItems[index];

                    return GestureDetector(
                      onTap: () {
                        //change filtering here
                        donutService.filterDonutsByType(item.label!);
                      },
                      child: Container(
                        child: Text(
                          '${item.label}',
                          style: TextStyle(
                              color: donutService.selectedDonutType == item.label
                                      ? Utils.mainColor
                                      : Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    AnimatedAlign(
                      alignment: alignmentBasedOnTap(donutService.selectedDonutType),
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3 - 20,
                        height: 5,
                        decoration: BoxDecoration(
                            color: Utils.mainColor,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                )
              ],
            );
          },
        ));
  }

  /// local method that takes as a parameter the label of the selected filter bar item
  Alignment alignmentBasedOnTap(filterBarLabel) {
    switch (filterBarLabel) {
      case 'Classic':
        return Alignment.centerLeft;
      case 'Sprinkled':
        return Alignment.center;
      case 'Stuffed':
        return Alignment.centerRight;
      default:
        return Alignment.centerLeft;
    }
  }
}
