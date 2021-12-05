import 'package:donuts_minishop/state/donut_bottom_bar_selection_service.dart';
import 'package:donuts_minishop/ui/home/donut_shop_home.dart';
import 'package:donuts_minishop/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:donuts_minishop/utils.dart';

void main() {
  runApp(const DonutsMiniShop());
}

class DonutsMiniShop extends StatelessWidget {
  const DonutsMiniShop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DonutBottomBarSelectionService())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          navigatorKey: Utils.mainAppNav, // this is the key that uniquely identifies the navigator stack.
          routes: {
            '/': (context) => const SplashPage(), // in the previous step we used the "home property" ( home: SplashPage() )
            '/main': (context) => const DonutShopMain()
          }),
    );
  }
}
