import 'dart:convert';

import 'package:police_officer_app/http/base-resource.dart';
import 'package:police_officer_app/http/models/access-resource-models.dart';

class AccessResource {
  static const ACCESS_CONTEXT_PATH = "/api/v1/access";

  static sendPhoneVerificationCode(SendPhoneVerificationCodeRequest request, BaseResponseListener listener) {
    BaseResource.makePostRequest("$ACCESS_CONTEXT_PATH/mobile/phone/verify", jsonEncode(request.toJson()), listener);
  }

  static verifyPhoneNumber(VerifyPhoneNumberRequest request, BaseResponseListener listener) {
    BaseResource.makePostRequest("$ACCESS_CONTEXT_PATH/mobile/phone/login", jsonEncode(request.toJson()), listener);
  }
}
