class UserModel {
  String name, lastname, email, address, gender;
  
  UserModel({
    required this.name,
    required this.lastname,
    required this.email,
    required this.address,
    required this.gender,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        lastname = json['lastname'],
        email = json['email'],
        address = json['address'],
        gender = json['gender'];
}
