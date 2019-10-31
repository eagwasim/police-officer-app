class User {
  String firstName;
  String lastName;
  String phoneNumber;
  String emailAddress;
  String bvn;
  String nin;
  String profilePhoto;
  String houseAddress;
  String badgeNumber;
  List<String> roles;
  int id;

  User({this.firstName, this.lastName, this.phoneNumber, this.bvn, this.nin, this.profilePhoto, this.houseAddress, this.emailAddress, this.id, this.roles});

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['first_name'] ?? null,
        lastName = json['last_name'] ?? null,
        phoneNumber = json['phone_number'] ?? null,
        bvn = json['bvn'] ?? null,
        nin = json['nin'] ?? null,
        profilePhoto = json['profile_photo'] ?? null,
        emailAddress = json['email_address'] ?? null,
        roles = List<String>.from(json['roles'] ?? []),
        id = json['id'] ?? null,
        badgeNumber = json['badge_number'] ?? null,
        houseAddress = json['house_address'] ?? null;

  @override
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'bvn': bvn,
      'nin': nin,
      'profile_photo': profilePhoto,
      'house_address': houseAddress,
      'email_address': emailAddress,
      'roles': roles,
      'id': id,
      'badge_number': badgeNumber
    };
  }

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, emailAddress: $emailAddress, bvn: $bvn, nin: $nin, profilePhoto: $profilePhoto, houseAddress: $houseAddress, badgeNumber: $badgeNumber, roles: $roles, id: $id}';
  }
}
