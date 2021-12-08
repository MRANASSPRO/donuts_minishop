import 'package:donuts_minishop/models/donut_product.dart';
import 'package:donuts_minishop/ui/home/filterBar/donut_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DonutList extends StatefulWidget {
  List<DonutProduct>? donutsProducts;

  DonutList({this.donutsProducts});

  @override
  _DonutListState createState() => _DonutListState();
}

class _DonutListState extends State<DonutList> {
  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();
  List<DonutProduct> insertDonutItems = [];

  @override
  void initState() {
    super.initState();

    var future = Future(() {});
    for (var i = 0; i < widget.donutsProducts!.length; i++) {
      //anonymous params are indicated with _
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 125), () {
          insertDonutItems.add(widget.donutsProducts![i]);
          _animatedListKey.currentState!.insertItem(i);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        scrollDirection: Axis.horizontal,
        initialItemCount: insertDonutItems.length,
        key: _animatedListKey,
        itemBuilder: (context, index, animation) {
          //return each donut item card
          DonutProduct currentDonut = widget.donutsProducts![index];

          return SlideTransition(
            position: Tween(
                    begin: const Offset(0.2, 0.0), end: const Offset(0.0, 0.0))
                .animate(CurvedAnimation(
                    parent: animation, curve: Curves.easeInOut)),
            child: FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(parent: animation, curve: Curves.easeInOut)),
              child: DonutCard(donutInfo: currentDonut),
            ),
          );
        });

    /*return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: widget.donutsProducts!.length,
        itemBuilder: (context, index) {
          //return each donut item card
          DonutProduct currentDonut = widget.donutsProducts![index];
          return DonutCard(donutInfo: currentDonut);
        }
    );*/
  }
}
