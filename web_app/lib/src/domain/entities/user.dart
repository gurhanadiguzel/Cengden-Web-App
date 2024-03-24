class User {
  final String id;
  String username;
  final String email;
  String password;
  String phoneNumber;
  String auth;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.auth,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      auth: json['auth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != '') '_id': {"\$oid": id},
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'auth': auth,
    };
  }
}
