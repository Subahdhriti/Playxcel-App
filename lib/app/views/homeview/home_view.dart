import 'package:flutter/material.dart';
import 'package:playxcel_app/app/views/homeview/app_bar.dart';
import 'package:playxcel_app/app/views/homeview/search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView ({
    super.key
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      body: Container(
        color: Colors.white,
        child: const AppSearchBar()    
    ),
    );
  }
}

