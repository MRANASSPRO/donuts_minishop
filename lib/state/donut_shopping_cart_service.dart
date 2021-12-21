import 'package:donuts_minishop/models/donut_product.dart';
import 'package:flutter/material.dart';

class DonutShoppingCartService extends ChangeNotifier {
  List<DonutProduct> cartDonuts = [];

  void addToCart(DonutProduct donut) {
    cartDonuts.add(donut);
    notifyListeners();
  }

  void removeFromCart(DonutProduct donut) {
    cartDonuts.removeWhere((donutElement) => donutElement.name == donut.name);
    notifyListeners();
  }

  void clearCart() {
    cartDonuts.clear();
    notifyListeners();
  }

  double getTotal() {
    double cartTotal = 0.0;
    cartDonuts.forEach((element) {
      cartTotal += element.price!;
    });

    return cartTotal;
  }

  bool isDonutInCart(DonutProduct donut) {
    return cartDonuts.any((element) => element.name == donut.name);
  }
}
