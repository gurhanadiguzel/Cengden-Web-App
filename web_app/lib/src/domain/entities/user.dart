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
    if (id != '') {
      return {
        '_id': {"\$oid": id},
        'username': username,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'auth': auth,
      };
    } else {
      return {
        'username': username,
        'email': email,
        'password': password,
        'phoneNumber': phoneNumber,
        'auth': auth,
      };
    }
  }
}
