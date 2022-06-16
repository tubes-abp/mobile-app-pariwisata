class Address {
  String? district;
  String? postCode;
  String? province;
  String? street;

  Address({
    this.district,
    this.postCode,
    this.province,
    this.street,
  });

  Address.fromjson(json) {
    district = json['district'];
    postCode = json['postCode'];
    province = json['province'];
    street = json['street'];
  }
}
