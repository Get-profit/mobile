class Address{

Address({
  this.place,
  this.district,
  this.city,
  this.postalcode,
  this.federativeUnit
});

  String place;
  String district;
  String city;
  String postalcode;
  String federativeUnit;

  @override
  String toString() {
    return 'Address{place: $place, district: $district, city: $city, postalcode: $postalcode, federativeUnit: $federativeUnit}';
  }


}