import 'dart:convert';

import 'package:police_officer_app/http/base-resource.dart';

class OfficerResource extends BaseResource {
  static const USER_CONTEXT_PATH = "/api/v1/officers";

  static void updateLocation(Map<String, dynamic> data, BaseResponseListener listener) {
    BaseResource.makePostRequest(USER_CONTEXT_PATH + "/location", jsonEncode(data), listener);
  }
}
