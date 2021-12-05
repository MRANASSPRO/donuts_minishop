import 'package:donuts_minishop/ui/home/pager/donut_pager.dart';
import 'package:flutter/material.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DonutPager()
      ],
    );
  }
}
