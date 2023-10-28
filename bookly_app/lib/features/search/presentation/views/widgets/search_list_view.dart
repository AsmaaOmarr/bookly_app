import 'package:bookly_app/core/widgets/custom_error-widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best-seller_item.dart';
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
              child: Text(
            'Search for your favorite Books 📖🥰',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ));
        } else if (state is SearchSuccess) {
          return ListView.builder(
            //take the size of your children
            //shrinkWrap: true,
            //physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return BestSellerItem(
                bookModel: state.books[index],
              );
            },
          );
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMsg: state.errorMsg);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
