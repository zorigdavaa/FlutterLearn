class User {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String password;

  User(
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.password,
  );
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['FirstName'],
      json['LastName'],
      json['PhoneNumber'],
      json['Email'],
      json['Password'],
    );
  }
}
