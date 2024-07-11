import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playxcel_app/app/Provider/add_to_cart_provider.dart';
import 'package:playxcel_app/app/Provider/favorite_provider.dart';
import 'package:playxcel_app/app/views/bottom_nav.dart';
import 'package:provider/provider.dart';


class PlayxcelApp extends StatelessWidget {
  const PlayxcelApp ({
    super.key
  });


  // @override
  // Widget build(BuildContext context) {
  //   return const MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: "Playxcel",
  //     home: HomeView()
  //   );
  // }

    @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          // for add to cart 
          ChangeNotifierProvider(create: (_)=>CartProvider()),
          // for favorite 
          ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.mulishTextTheme(),
          ),
          home: const BottomNavBar(),
        ),
      );
}