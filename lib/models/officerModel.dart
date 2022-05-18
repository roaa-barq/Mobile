class officerModel {
  late String Identity;
  late String name;
  late String phone;
  late String password;
  late String id;

  officerModel(this.Identity, this.name, this.phone, this.id);

  officerModel.fromJson(Map<String, dynamic> map) {
    this.Identity = map['Identity'];
    this.name = map['name'];
    this.phone = map['phone'];
    this.id = map['_id'];
    this.password = map['password'];
  }
}
