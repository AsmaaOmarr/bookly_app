import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItem extends StatelessWidget {
  final double widthRatio;
  final BookModel bookModel;
  const BookItem({
    Key? key,
    required this.widthRatio,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push('/bookDetailsView',extra: bookModel);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: CachedNetworkImage(
            imageUrl: bookModel.volumeInfo.imageLinks.thumbnail,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline_rounded),
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width * widthRatio,
          ),
        ),
      ),
    );
  }
}
