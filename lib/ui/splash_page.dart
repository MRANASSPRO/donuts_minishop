import 'package:donuts_minishop/ui/home/donut_shop_home.dart';
import 'package:donuts_minishop/utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
   SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  /// SingleTickerProviderStateMixin mixin will provide this class with the Ticker instance it needs;
  /// an AnimationController needs a TickerProvider
  AnimationController? donutController;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    super.initState();
    donutController = AnimationController(
        duration: const Duration(seconds: 5),
        vsync: this) /// this here refers to the existing TickerProvider instance
      ..repeat(); /// the spread operator (the two dots right after the instance => this)

    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: donutController!, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    /// the delayed method takes a duration and a callback
    Future.delayed(const Duration(seconds: 10), () {
      Utils.mainAppNav.currentState?.pushReplacementNamed('/main'); /// before we used Navigator.of(context).pushReplacement()
    });

    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Center(
        child: Column(
          /// vertical alignment:
          mainAxisAlignment: MainAxisAlignment.center,
          /// horizontal alignment:
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// The RotationTransition widget is one of the explicit animation widgets (SlideTransition, FadeTransition...)
            /// All explicit animations require an AnimationController.
            RotationTransition(
              turns: rotationAnimation!,
              child: Image.network(
                Utils.donutLogoWhiteNoText,
                width: 100,
                height: 100,
              ),
            ),
            Image.network(
              Utils.donutLogoWhiteText,
              width: 150,
              height: 150,
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    /// AnimationController objects, since they take up precious resources during their execution,
    /// it is best practice to always dispose of them
    donutController!.dispose();
    super.dispose();
  }
}
