import 'dart:convert';

import 'package:police_officer_app/http/base-resource.dart';
import 'package:police_officer_app/models/user-model.dart';

class UserResource {
  static const USER_CONTEXT_PATH = "/api/v1/users";

  static void updateUserDetails(User user, BaseResponseListener listener) {
    BaseResource.makePostRequest("$USER_CONTEXT_PATH", jsonEncode(user.toJson()), listener);
  }

}
