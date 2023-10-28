import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              AssetsData.logo,
              height: 60,
              width: 84,
            ),
            IconButton(
              icon: const Icon(
                CupertinoIcons.search,
                size: 30,
              ),
              onPressed: () {
                GoRouter.of(context).push('/search');
              },
            )
          ],
        ),
      ),
    );
  }
}
