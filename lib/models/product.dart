class Product {
  int? id;
  String? name;
  String? imageUrl;
  int? price;

  Product({
    this.id,
    this.imageUrl,
    this.name,
    this.price,
  });

  Product.fromJson(json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageUrl = json['image_url'];
  }
}
