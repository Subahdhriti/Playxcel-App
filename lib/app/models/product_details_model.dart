

class ProductDetails {
  final String title; 
  final String id; 
  final String description; 
  final String availability;
  final List<ImageDetails>? images;
  final double price;
  final double mrp;
  final String category;
  final String categoryId;
  final RatingDetails? ratingDetails;
  int quantity;

  ProductDetails(
      {required this.title,
      required this.id,
      required this.description,
      required this.availability,
      this.images,
      required this.price,
      required this.mrp,
      this.ratingDetails,
      required this.category,
      required this.categoryId,
      required this.quantity});

  factory ProductDetails.fromJson(Map<String, dynamic> json) {
    var images = (json['images'] ?? []) as List;
    List<ImageDetails> imageList = images.map((i) => ImageDetails.fromJson(i)).toList();
    return ProductDetails(
      id: json['id'],
      title: json['name'],
      price: json['price'],
      mrp: json['mrp'],
      description: json['description'],
      availability: (json['availability'] ?? ""),
      images: imageList,
      category: json['category'],
      categoryId: (json['categoryId'] ?? ""),
      quantity: json['stock'],
      ratingDetails: RatingDetails.fromJson((json['ratingDetails'] ?? {}))
    );
  }
}

class ImageDetails {
  final String alt;
  String url;

  ImageDetails({
    required this.alt,
    required this.url
  });

  factory ImageDetails.fromJson(Map<String, dynamic> json){
    return ImageDetails(
      alt: json['alt'],
      url: json['url']
    );
  }
}

class RatingDetails {
  final double average;
  final int count;

  RatingDetails({
    required this.average,
    required this.count
  });


  factory RatingDetails.fromJson(Map<String, dynamic> json){
    return RatingDetails(
      average: (json['average'] ?? 0),
      count: (json['count'] ?? 0)
    );
  }
}
