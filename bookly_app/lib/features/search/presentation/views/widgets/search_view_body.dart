import 'package:bookly_app/features/search/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 22, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBarSearchView(),
          SizedBox(
            height: 20,
          ),
          Text(
            "    Search Result",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: SearchListView()),
          // GestureDetector(
          //   onTap: () {
          //     GoRouter.of(context).push('/homeView');
          //   },
          //   child: const Align(
          //     alignment: Alignment.topLeft,
          //     child: Text(
          //       "    Go To Home 🏠",
          //       style: TextStyle(
          //         color: Colors.blue,
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.33,
          // ),
          // Image.asset(
          //   AssetsData.logo,
          //   height: 60,
          //   width: 150,
          // ),
          // const Text('Search for your favorite books'),
        ],
      ),
    );
  }
}

