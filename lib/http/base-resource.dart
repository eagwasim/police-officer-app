import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:police_officer_app/utils/shared-preference-util.dart';

class BaseResponse {
  int statusCode;
  String statusMessage;
  String data;

  BaseResponse({this.statusCode, this.statusMessage, this.data});

  @override
  String toString() {
    return 'BaseResponse{statusCode: $statusCode, statusMessage: $statusMessage, data: $data}';
  }


}

abstract class BaseResponseListener {
  void onResponse(BaseResponse response);
}

abstract class BaseResource {
  static const BASE_URL = "https://police-ng.appspot.com";

  static void makePostRequest(String url, String data, BaseResponseListener listener) {
    Map<String, String> headers;

    Future<String> authToken = SharedPreferenceUtil.getToken();

    authToken.then((token) {
      if (token != null) {
        headers = {"Content-type": "application/json", "Authorization": "Bearer $token"};
      } else {
        headers = {"Content-type": "application/json"};
      }

      Future<http.Response> futureResponse = http.post(
        BASE_URL + url,
        headers: headers,
        body: data,
      );

      futureResponse.then((resp) {
        listener.onResponse(
          BaseResponse(
            statusCode: resp.statusCode,
            statusMessage: resp.reasonPhrase,
            data: resp.body,
          ),
        );
      }, onError: (error) {
        print(error);
        listener.onResponse(BaseResponse(
          statusCode: 500,
          statusMessage: "Could not process your request, check your internet connection",
          data: null,
        ));
      });
    });
  }

  static void makePutRequest(String url, String data, BaseResponseListener listener) {
    Map<String, String> headers;

    Future<String> authToken = SharedPreferenceUtil.getToken();

    authToken.then((token) {
      if (token != null) {
        headers = {"Content-type": "application/json", "Authorization": "Bearer $token"};
      } else {
        headers = {"Content-type": "application/json"};
      }

      Future<http.Response> futureResponse = http.put(
        BASE_URL + url,
        headers: headers,
        body: data,
      );

      futureResponse.then((resp) {
        listener.onResponse(
          BaseResponse(
            statusCode: resp.statusCode,
            statusMessage: resp.reasonPhrase,
            data: resp.body,
          ),
        );
      }, onError: (error) {
        listener.onResponse(BaseResponse(
          statusCode: 500,
          statusMessage: "Could not process your request, check your internet connection",
          data: null,
        ));
      });
    });
  }
}
