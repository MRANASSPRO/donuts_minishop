import 'package:donuts_minishop/utils.dart';
import 'package:flutter/material.dart';

class PageViewIndicator extends StatelessWidget {
  PageController? pageController;
  int? numberOfPages;
  int? currentPage;

  /// add curly braces {} to the PageViewIndicator constructor to make the params optional
  PageViewIndicator(
      {this.pageController, this.numberOfPages, this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfPages!, (index) {
        return GestureDetector(
          onTap: () {
            // trigger the page viewer from here
            pageController?.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            height: 15,
            width: 15,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: currentPage == index
                    ? Utils.mainColor
                    : Colors.grey.withOpacity(0.2)),
          ),
        );
      }),
    );
  }
}
