class UserModel {
  String? email;
  String? uid;
  String? name;
  String? phone;
  String? password;


  UserModel(
      {required this.name,
        required this.email,
        required this.uid,
        required this.phone,
        required this.password
      });

  UserModel.fromJson(Map<String, dynamic>? json) {
    email = json!['email'];
    name = json['name'];
    uid = json['uid'];
    phone = json['phone'];
    password = json['password'];

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'email': email,
      'isEmailVerified':phone,
      'profileImage': password,

    };
  }
}
