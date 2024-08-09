import 'package:flutter/material.dart';
import 'package:playxcel_app/app/models/product_details_model.dart';
import 'package:playxcel_app/app/models/product_model.dart';
import 'package:playxcel_app/app/repository/product_repository.dart';
import 'package:playxcel_app/app/views/detail/detail_app_bar.dart';
import 'package:playxcel_app/app/views/detail/detailed_image_slider.dart';
import 'package:playxcel_app/app/views/homeview/app_bar.dart';
import 'package:playxcel_app/constants.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;
  const ProductDetailsView({
    super.key,
    required this.product
  });

  @override
  State<ProductDetailsView> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsView> {

  int currentImage = 0;

  late Future<ProductDetails> productDetailsFuture;

  @override
  void initState() {
    super.initState();
    productDetailsFuture = fetchProductDetails("item0001", "token");
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: kcontentColor,
      //floatingActionButton: AddToCart(product: widget.product),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DetailAppBar(),
              
              FutureBuilder<ProductDetails>(
                future: productDetailsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return detailsColum(snapshot.data!);
                  } else {
                    return const Text('No data');
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column detailsColum(ProductDetails productDetails) {
    return Column(
      children: [
        MyImageSlider(
          image: (productDetails.images!.isEmpty ? altImageUrl : productDetails.images![currentImage].url),
          onChange: (index) {
            setState(() {
              currentImage = index;
            });
          },
        ),

        const SizedBox(height: 10),

        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                5,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: currentImage == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentImage == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),

        const SizedBox(height: 20),

        Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 100,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // for product name, price, rating, and seller
                 // ItemsDetails(product: widget.product),
                  SizedBox(height: 20),
                  
                   // for description
                   //Description(description: widget.product.description,)
                ],
              ),
            )
      ],
    );
  }

}