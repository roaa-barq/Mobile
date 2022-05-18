class adminModel {
  late String Identity;
  late String name;
  late String phone;
  late String password;
  late String id;

  adminModel(this.Identity, this.name, this.phone, this.id);

  adminModel.fromJson(Map<String, dynamic> map) {
    this.Identity = map['Identity'];
    this.name = map['name'];
    this.phone = map['phone'];
    this.id = map['_id'];
    this.password = map['password'];
  }
}
