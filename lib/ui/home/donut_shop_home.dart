import 'package:donuts_minishop/ui/bottom/donut_bottom_bar.dart';
import 'package:donuts_minishop/ui/drawer/donut_side_menu.dart';
import 'package:donuts_minishop/ui/home/pages/donut_main_page.dart';
import 'package:donuts_minishop/utils.dart';
import 'package:flutter/material.dart';

class DonutShopMain extends StatelessWidget {
  const DonutShopMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
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
          Expanded(
              child: Navigator(
                  key: Utils.mainListNav,
                  initialRoute: '/main',

                  /// At the end of the onGenerateRoute method, return a PageRouteBuilder,
                  /// provides a pageBuilder callback, which returns the widget to be displayed onto the stack
                  /// we should match the settings.name from RouteSettings with the corresponding page to be pushed to the Stack
                  onGenerateRoute: (/*RouteSettings*/ settings) {
                    Widget page;
                    switch (settings.name) {
                      case '/main':
                        page = const DonutMainPage();
                        break;
                      case '/favorites':
                        page = const Center(child: Text('favorites'));
                        break;
                      case '/shoppingCart':
                        page = const Center(child: Text('shopping cart'));
                        break;
                      default:
                        page = const Center(child: Text('main'));
                        break;
                    }
                    return PageRouteBuilder(
                        pageBuilder: (_, __, ___) => page,
                        transitionDuration: const Duration(seconds: 0));
                  })
              ),
          const DonutBottomBar()
        ],
      ),
    );
  }
}
