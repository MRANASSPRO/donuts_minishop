import 'package:donuts_minishop/state/donut_bottom_bar_selection_service.dart';
import 'package:donuts_minishop/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutBottomBar extends StatelessWidget {
  DonutBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      /// only the consumer widget will rebuild itself
      /// when call up to the service with the new value, and thus invoking the notifyListeners method
      child: Consumer<DonutBottomBarSelectionService>(builder:
          (context, bottomBarSelectionService, Widget? child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  bottomBarSelectionService.setTabSelection('main');
                },
                icon: Icon(Icons.trip_origin,
                    color: bottomBarSelectionService.tabSelection == 'main'
                        ? Utils.mainDark
                        : Utils.mainColor)),
            IconButton(
                onPressed: () {
                  bottomBarSelectionService.setTabSelection('favorites');
                },
                icon: Icon(Icons.favorite,
                    color: bottomBarSelectionService.tabSelection == 'favorites'
                        ? Utils.mainDark
                        : Utils.mainColor)),
            IconButton(
                onPressed: () {
                  bottomBarSelectionService.setTabSelection('shoppingCart');
                },
                icon: Icon(Icons.shopping_cart,
                    color:
                        bottomBarSelectionService.tabSelection == 'shoppingCart'
                            ? Utils.mainDark
                            : Utils.mainColor)),
          ],
        );
      }),
    );
  }
}
