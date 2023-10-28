// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBarSearchView extends StatefulWidget {
  const CustomAppBarSearchView({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBarSearchView> createState() => _CustomAppBarSearchViewState();
}

class _CustomAppBarSearchViewState extends State<CustomAppBarSearchView> {
  String searchSubject='';
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: myController,
          onChanged: (value) {
            searchSubject = value;
          },
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Type Something',
            suffixIcon: IconButton(
              onPressed: () {
                searchSubject = myController.text;
                print(searchSubject);
                BlocProvider.of<SearchCubit>(context)
                    .fetchSearchBooks(searchSubject);
              },
              icon: const Icon(
                CupertinoIcons.search,
                size: 30,
              ),
            ),
            suffixIconColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.4,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.4,
              ),
            ),
          ),
        ),
      ),
    );
    // return SafeArea(
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Image.asset(
    //           AssetsData.logo,
    //           height: 60,
    //           width: 40,
    //         ),
    //         //TextField(),
    //         IconButton(
    //           icon: const Icon(
    //             CupertinoIcons.search,
    //             size: 30,
    //           ),
    //           onPressed: () {},
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
