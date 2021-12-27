import 'package:donuts_minishop/state/donut_shopping_cart_service.dart';
import 'package:donuts_minishop/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutShoppingCartPage extends StatefulWidget {
  const DonutShoppingCartPage({Key? key}) : super(key: key);

  @override
  _DonutShoppingCartPageState createState() => _DonutShoppingCartPageState();
}

class _DonutShoppingCartPageState extends State<DonutShoppingCartPage>
    with SingleTickerProviderStateMixin {

  AnimationController? titleAnimationController;

  @override
  void initState() {
    super.initState();

    titleAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..forward();
  }

  @override
  void dispose() {
    titleAnimationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                  parent: titleAnimationController!, curve: Curves.easeInOut)),
              child: Image.network(Utils.donutTitleMyDonuts, width: 170)),
          Expanded(
            child: Consumer<DonutShoppingCartService>(
              builder: (context, cartService, child) {
                if (cartService.cartDonuts.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart,
                              color: Colors.grey[300], size: 50),
                          const SizedBox(height: 20),
                          const Text(
                            'You don\'t have any items on your cart yet',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
