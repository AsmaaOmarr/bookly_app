import 'package:bookly_app/core/widgets/custom_error-widget.dart';
import 'package:bookly_app/features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  final double widthRatio;
  final double heightRatio;
  const FeaturedBooksListView({
    super.key,
    required this.widthRatio,
    required this.heightRatio,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          //List<BookModel> books = state.books;
          return SizedBox(
            height: MediaQuery.of(context).size.height * heightRatio,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return BookItem(
                    bookModel: state.books[index],
                    widthRatio: widthRatio,
                  );
                },
              ),
            ),
          );
        } else if (state is FeatureBooksFailure) {
          return CustomErrorWidget(errorMsg: state.errorMsg);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
