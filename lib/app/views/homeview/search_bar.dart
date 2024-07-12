import 'package:flutter/material.dart';
import 'package:playxcel_app/constants.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kcontentColor,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 30,
          ),
          const SizedBox(width: 10),
          const Flexible(
            flex: 4,
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search...", border: InputBorder.none),
            ),
          ),
          Container(
            height: 25,
            width: 1.5,
            color: Colors.grey,
          ),
          IconButton(
            style: IconButton.styleFrom(
            backgroundColor: kcontentColor,
            padding: const EdgeInsets.all(5),
          ),
            onPressed: () {},
            icon: const Icon(
              Icons.tune,
              color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}