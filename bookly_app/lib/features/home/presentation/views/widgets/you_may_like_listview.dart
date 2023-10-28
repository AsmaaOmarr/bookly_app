import 'package:bookly_app/core/widgets/custom_error-widget.dart';
import 'package:bookly_app/features/home/presentation/manager/you_may_like_cubit/you_may_like_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YouMayLikeListView extends StatelessWidget {
  const YouMayLikeListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<YouMayLikeCubit, YouMayLikeState>(
      builder: (context, state) {
        if (state is YouMayLikeSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.18,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return BookItem(
                    bookModel: state.books[index],
                    widthRatio: 0.25,
                  );
                },
              ),
            ),
          );
        } else if (state is YouMayLikeFailure) {
          return CustomErrorWidget(errorMsg: state.errorMsg);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
