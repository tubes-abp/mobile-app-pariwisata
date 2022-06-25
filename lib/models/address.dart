class Address {
  String? district;
  String? postCode;
  String? province;
  String? street;
  double? latitude;
  double? longitude;

  Address({
    this.district,
    this.postCode,
    this.province,
    this.street,
    this.latitude,
    this.longitude,
  });

  Address.fromjson(json) {
    district = json['district'];
    postCode = json['postCode'];
    province = json['province'];
    street = json['street'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}
