
import 'package:flutter/material.dart';
import 'package:playxcel_app/app/models/category.dart';
import 'package:playxcel_app/app/models/product_list_response.dart';
import 'package:playxcel_app/app/repository/product_repository.dart';
import 'package:playxcel_app/app/views/categories/product_card.dart';
import 'package:playxcel_app/app/views/homeview/app_bar.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  int selectedIndex = 0;

  late Future<ProductList> sportsProduct;
  late Future<ProductList> shoes;
  late Future<ProductList> accessories;
  late Future<ProductList> fasion;

  @override
  void initState() {
    super.initState();
    sportsProduct = fetchProducts("sports", "token");
    shoes =  fetchProducts("shoes", "token");
    accessories = fetchProducts("accessories", "token");
    fasion = fetchProducts("fasion", "token");
  }

  @override
  Widget build(BuildContext context) {

    List<Future<ProductList>> selectcategories = [
      sportsProduct,
      shoes,
      fasion,
      accessories
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 35),
              const MyAppBar(),
              categoryItems(),

              // for shopping items
              const SizedBox(height: 10),

              FutureBuilder<ProductList>(
                future: selectcategories[selectedIndex],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return gridViewBuilder(snapshot.data!);
                  } else {
                    return const Text('No data');
                  }
                }
              ),
            ],
          ),
        ),
      )
    );
  }


  GridView gridViewBuilder(ProductList data) {
    return GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: data.productList.length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: data.productList[index],
                  );
                },
              );
  }

  SizedBox categoryItems() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: selectedIndex == index
                    ? Colors.blue[200]
                    : Colors.transparent,
              ),
              child: Column(
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(categoriesList[index].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    categoriesList[index].title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  
}
