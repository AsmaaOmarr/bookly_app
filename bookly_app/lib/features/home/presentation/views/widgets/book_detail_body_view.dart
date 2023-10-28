import 'package:bookly_app/core/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_details_content.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_appbar_for_book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_button.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/you_may_like_listview.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailBody extends StatelessWidget {
  const BookDetailBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomAppBarForBookDetailsView(),
        BookDetailsContent(
          bookModel: bookModel,
        ),
        const SizedBox(
          height: 40,
        ),
        CustomButton(
          onTap: ()  {
            // Uri uri = Uri.parse(bookModel.volumeInfo.previewLink!);
            // if (await canLaunchUrl(uri)) {
            //   await launchUrl(uri);
            // } else {
              
            // }
          },
        ),
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 22.0, bottom: 20),
          child: Text(
            'You may also Like',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        const YouMayLikeListView(),
      ],
    );
  }
}
