import 'package:flutter/material.dart';
import 'package:playxcel_app/app/views/homeview/app_bar.dart';
import 'package:playxcel_app/app/views/homeview/image_slider.dart';
import 'package:playxcel_app/app/views/homeview/search_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView ({
    super.key
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentSlider = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 35),

              // for custom appbar
              const MyAppBar(),
              const SizedBox(height: 20),

              // for search bar
              const AppSearchBar(),
              const SizedBox(height: 20),

              // for image slider
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(
                    () {
                      currentSlider = value;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

