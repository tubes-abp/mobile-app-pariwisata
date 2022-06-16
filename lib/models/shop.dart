import 'package:wesata_mobile/models/address.dart';

class Shop {
  int? id;
  String? name;
  String? imageUrl;
  Address? address;

  Shop({
    this.id,
    this.name,
    this.imageUrl,
    this.address,
  });

  Shop.fromJson(json) {
    if (json['address'] != null) {
      var addressObjsJson = json['address'] as List;
      List<Address> addresss =
          addressObjsJson.map((item) => Address.fromjson(item)).toList();
      address = addresss[0];
    } else {
      address = json['address'];
    }
    id = json['id'];
    name = json['shop'];
    imageUrl = json['shop_img_url'];
  }
}
