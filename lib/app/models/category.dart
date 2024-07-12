class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categoriesList = [
  Category(
    title: "All",
    image: "assets/images/all.png",
  ),
  Category(
    title: "Shoes",
    image: "assets/images/shoes.png",
  ),
  Category(
    title: "Women's\nFashion",
    image: "assets/images/image1.png",
  ),
  Category(
    title: "Men's\nFashion",
    image: "assets/images/men.png",
  ),
];
