class User {
  final String id;
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String auth;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.auth,
  });

  User.copy(User param)
      : this.id = param.id,
        this.username = param.username,
        this.email = param.email,
        this.password = param.password,
        this.phoneNumber = param.phoneNumber,
        this.auth = param.auth;

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'auth': auth,
    };
  }

  User.fromJson(Map<String, dynamic> map, String id)
      : id = id,
        username = map['username'],
        email = map['email'],
        password = map['password'],
        phoneNumber = map['phoneNumber'],
        auth = map['auth'];
}
