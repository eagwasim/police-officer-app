class LoginResponseLocation {
  String city;
  String country;
  String latLon;
  String region;

  LoginResponseLocation({this.city, this.country, this.latLon, this.region});

  static LoginResponseLocation fromJson(Map<String, dynamic> json) {
    return LoginResponseLocation(
      city: json["city"] ?? null,
      country: json["country"] ?? null,
      latLon: json["lat_lon"] ?? null,
      region: json["region"] ?? null,
    );
  }
}

class LoginResponseUser {
  String firstName;
  String lastName;
  String phoneNumber;
  String bvn;
  String nin;
  String profilePhoto;
  String houseAddress;
  String role;

  LoginResponseLocation lastKnownLocation;

  LoginResponseUser(this.firstName, this.lastName, this.phoneNumber, this.bvn, this.nin, this.profilePhoto, this.houseAddress, this.lastKnownLocation, this.role);

  LoginResponseUser.fromJson(Map<String, dynamic> json)
      : firstName = json['first_name'] ?? null,
        lastName = json['last_name'] ?? null,
        phoneNumber = json['phone_number'] ?? null,
        bvn = json['bvn'] ?? null,
        nin = json['nin'] ?? null,
        profilePhoto = json['profile_photo'] ?? null,
        houseAddress = json['house_address'] ?? null,
        role = json['role'] ?? null,
        lastKnownLocation = json["last_known_location"] == null ? null : LoginResponseLocation.fromJson(json["last_known_location"]);
}

class LoginResponse {
  String token;
  LoginResponseUser user;

  LoginResponse({this.token, this.user});

  static LoginResponse fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      token: json["token"] ?? null,
      user: json["user"] == null ? null : LoginResponseUser.fromJson(json["user"]),
    );
  }
}

class SendPhoneVerificationCodeRequest {
  String phoneNumber;
  String origin = 'APP_OFFICER';

  SendPhoneVerificationCodeRequest(this.phoneNumber);

  Map<String, dynamic> toJson() {
    return {"phone_number": this.phoneNumber, "origin": this.origin};
  }
}

class VerifyPhoneNumberRequest {
  String phoneNumber;
  String verificationCode;

  VerifyPhoneNumberRequest({this.phoneNumber, this.verificationCode});

  Map<String, dynamic> toJson() {
    return {
      "phone_number": this.phoneNumber,
      "verification_code": this.verificationCode,
    };
  }
}
