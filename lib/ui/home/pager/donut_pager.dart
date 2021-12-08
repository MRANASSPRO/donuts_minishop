import 'package:donuts_minishop/models/donut_page_item.dart';
import 'package:donuts_minishop/ui/home/pager/page_view_indicator.dart';
import 'package:flutter/material.dart';
import 'package:donuts_minishop/utils.dart';

class DonutPager extends StatefulWidget {
  DonutPager({Key? key}) : super(key: key);

  @override
  _DonutPagerState createState() => _DonutPagerState();
}

class _DonutPagerState extends State<DonutPager> {
  List<DonutPage> pages = [
    DonutPage(imgUrl: Utils.donutPromo1, logoImgUrl: Utils.donutLogoWhiteText),
    DonutPage(imgUrl: Utils.donutPromo2, logoImgUrl: Utils.donutLogoWhiteText),
    DonutPage(imgUrl: Utils.donutPromo3, logoImgUrl: Utils.donutLogoWhiteText),
  ];

  int currentPage = 0;
  PageController? pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3 - 20, // this size is measured with px
      child: Column(
        children: [
          Expanded(
              child: PageView(
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            controller: pageController,

            ///  use the List.generate factory method with this list
            ///  to generate widgets on the fly based on how many DonutPage objects we have,
            children: List.generate(pages.length, (index) {
              DonutPage page = pages[index];

              /// build each PageView page out of this Container widget
              return Container(
                alignment: Alignment.bottomLeft,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 15,
                          offset: const Offset(0.0, 5.0))
                    ],
                    image: DecorationImage(
                        image: NetworkImage(page.imgUrl!), fit: BoxFit.cover),
                ),
                child: Image.network(page.logoImgUrl!, width: 120),
              );
            }),

            /// hook up a callback to the onPageChanged event
            /// which will rebuild the Pager state and the PageViewIndicator as well
            onPageChanged: (newPage) {
              setState(() {
                currentPage = newPage;
              });
            },
          )),
          PageViewIndicator(
            pageController: pageController,
            numberOfPages: pages.length,
            currentPage: currentPage,
          )
        ],
      ),
    );
  }

  @override

  /// Don't forget to always dispose your controllers after using them
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }
}
