import 'package:donuts_minishop/state/donut_bottom_bar_selection_service.dart';
import 'package:donuts_minishop/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: SplashPage()),
    );
  }
}
