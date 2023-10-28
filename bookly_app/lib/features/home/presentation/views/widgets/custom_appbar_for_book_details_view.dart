import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBarForBookDetailsView extends StatelessWidget {
  const CustomAppBarForBookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.close,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.cart,
                size: 28,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
