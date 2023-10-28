import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  const CustomButton({
    super.key, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * .4,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
          ),
          child: const Center(
            child: Text(
              '19.99 €',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 22,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * .4,
          decoration: BoxDecoration(
            color: Colors.red[300],
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: GestureDetector(
            onTap: onTap,
            child: const Center(
              child: Text(
                'Free Review',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  //color: kPrimaryColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
