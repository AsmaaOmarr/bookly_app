import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item_listview.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/featured_books_listview.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              SizedBox(
                height: 5,
              ),
              FeaturedBooksListView(
                widthRatio: 0.37,
                heightRatio: 0.3,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24, top: 50),
                child: Text(
                  "Best Seller",
                  //textAlign: TextAlign.start,
                  style: Styles.titleMiddle,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: BestSellerItemListView(),
        ),
      ],
    );
    // return const Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     CustomAppBar(),
    //     SizedBox(
    //       height: 5,
    //     ),
    //     FeaturedBooksListView(),
    //     Padding(
    //       padding: EdgeInsets.only(left: 24, top: 50),
    //       child: Text(
    //         "Best Seller",
    //         //textAlign: TextAlign.start,
    //         style: Styles.titleMiddle,
    //       ),
    //     ),
    //     SizedBox(
    //       height: 10,
    //     ),
    //     BestSellerItemListView(),
    //   ],
    // );
  }
}
