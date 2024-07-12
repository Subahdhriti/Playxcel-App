import 'package:flutter/material.dart';
import 'package:playxcel_app/constants.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

    @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/icons/playxcel-icon.png",
            height: 50,
          ),
        ),
        IconButton(
          style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: const EdgeInsets.all(10),
          ),
          onPressed: () {},
          iconSize: 25,
          icon: const Icon(Icons.notifications_outlined),
        ),
      ],
    );
  }
  
} 