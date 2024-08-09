  import 'package:flutter/material.dart';

  class DetailAppBar extends StatelessWidget {
    const DetailAppBar({
      super.key,
    });

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {},
              iconSize: 25,
              icon: const Icon(Icons.notifications_outlined),
            ),
            const SizedBox(width: 10),
            IconButton(
                style: IconButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(10),
              ),
              onPressed: () {},
              iconSize: 25,
              icon: const Icon(Icons.shopping_cart),
              ),
              ],
            )
          ],
        ),
      );
    }
    
  } 