import 'package:flutter/material.dart';
import 'package:donuts_minishop/utils.dart';

class DonutBottomBar extends StatelessWidget {
  const DonutBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.trip_origin, color: Utils.mainColor)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite, color: Utils.mainColor)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.shopping_cart, color: Utils.mainColor)),
        ],
      ),
    );
  }
}
