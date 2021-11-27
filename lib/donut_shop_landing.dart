import 'package:donuts_minishop/ui/donut_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'utils.dart';
import 'package:donuts_minishop/ui/donut_side_menu.dart';

class DonutShopLanding extends StatelessWidget {
  const DonutShopLanding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: DonutSideMenu(),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Utils.mainDark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.network(Utils.donutLogoRedText, width: 120),
      ),
      body: Column(
        children: [
          Expanded(child: Container() //placeholder for Navigator
              ),
          const DonutBottomBar()
          //placeholder for BottomBar
        ],
      ),
    );
  }
}
