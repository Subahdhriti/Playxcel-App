import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "PLAYXCEL", 
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.white,
          fontSize: BorderSide.strokeAlignInside
        ),
        ),
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icon/playxcel.svg',
          
        ),
        onPressed: (){}
      ),
      backgroundColor: Colors.deepOrange,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}