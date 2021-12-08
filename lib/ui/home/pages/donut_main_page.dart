import 'package:donuts_minishop/state/donut_filter_service.dart';
import 'package:donuts_minishop/ui/home/filterBar/donut_filter_bar.dart';
import 'package:donuts_minishop/ui/home/filterBar/donut_list.dart';
import 'package:donuts_minishop/ui/home/pager/donut_pager.dart';
import 'package:donuts_minishop/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutMainPage extends StatelessWidget {
  DonutMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DonutPager(),
        DonutFilterBar(),
        Expanded(
          child: Consumer<DonutFilterService>(
            builder: (context, donutService, child) {
              return DonutList(donutsProducts: donutService.filteredDonuts);
            },
          ),
        ),
      ],
    );
  }
}
