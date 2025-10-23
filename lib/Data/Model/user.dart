class User {
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  int userTypeID;

  User(
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.email,
    this.userTypeID,
  );
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['FirstName'],
      json['LastName'],
      json['PhoneNumber'],
      json['Email'],
      json['UserTypeID'],
      // "",
    );
  }
}
