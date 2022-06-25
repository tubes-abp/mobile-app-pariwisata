class Address {
  String? district;
  String? postCode;
  String? province;
  String? street;
  String? linkMap;

  Address({
    this.district,
    this.postCode,
    this.province,
    this.street,
    this.linkMap,
  });

  Address.fromjson(json) {
    district = json['district'];
    postCode = json['postCode'];
    province = json['province'];
    street = json['street'];
    linkMap = json['link_map'];
  }
}
