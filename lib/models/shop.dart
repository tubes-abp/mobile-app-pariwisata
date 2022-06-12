class Shop {
  int? id;
  String? name;
  String? imageUrl;
  String? district;
  String? city;

  Shop({
    this.id,
    this.imageUrl,
    this.name,
    this.district,
    this.city,
  });

  Shop.fromJson(json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    district = json['district'];
    city = json['city'];
  }
}
