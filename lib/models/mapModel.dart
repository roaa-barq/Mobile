class mapModel {
  late String sizePoint;
  late String lat;
  late String long;
  late String id;

  mapModel(this.sizePoint, this.lat, this.long, this.id);

  mapModel.fromJson(Map<String, dynamic> map) {
    this.sizePoint = map['sizePoint'];
    this.lat = map['lat'];
    this.long = map['long'];
    this.id = map['_id'];
  }
}
