import 'dart:convert';

import 'package:cofinex/data_model/model/get_otp_model.dart';
import 'package:http/http.dart' as http;

class APIUtils {
  final appName = 'Cofinex';
  static const baseURL = "https://letswinsports.io/service";
  static const initURL = "https://dataapi.cofinex.io/";
  static const authURL = "https://auth.cofinex.io/";
  static const registerURL = "users/createUser";
  static const sentOTPURL = "users/generateOTP";
  static const fetchOTPURL = "users/getOTP";
  static const verifyEmailURL = "users/emailVerified";

  Future<dynamic> doRegisterEmail(String firstName, String lastName,
      String email, String countryISOCode, String password) async {
    var emailbodyData = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'countryISOCode': countryISOCode,
      'password': password
    };


    final response = await http.post(
      Uri.parse(initURL + registerURL),
      body: emailbodyData,
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
      },
    );
    if(response.statusCode==200)
    {

      return json.decode(response.body);
    }
    else
    {
      return false;
    }

  }

  Future<dynamic> generateOTP(
    String userId,
  ) async {
    var emailbodyData = {
      'userId': userId,
      'action': "VERIFY_EMAIL",
    };

    final response =
        await http.post(Uri.parse(initURL + sentOTPURL), body: emailbodyData,     headers: {
          'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
        },);

    return json.decode(response.body);
  }

  Future<GetOtpModel> fetchOTP(
    String userId,
  ) async {
    var emailbodyData = {
      'userId': userId,
      'action': "VERIFY_EMAIL",
    };

    final response =
        await http.post(Uri.parse(initURL + fetchOTPURL), body: emailbodyData,     headers: {
          'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
        },);

    return GetOtpModel.fromJson(json.decode(response.body));
  }

  Future<dynamic> verifyEmail(
    String userId,
  ) async {
    var emailbodyData = {
      'userId': userId,
    };

    final response = await http.put(Uri.parse(initURL + verifyEmailURL),
        body: emailbodyData,     headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
      },);

    return json.decode(response.body);
  }

  Future<dynamic> doLoginEmail(
      String email, String password) async {
    var emailbodyData = {
      'username': email,
      'password': password,
      'client_id': "cofinex-exchange",
      'scope': "openid",
      'grant_type': "password",
      'totp': "26316740",
    };

    final response = await http.post(
      Uri.parse(authURL + "realms/cofinex/protocol/openid-connect/token"),
      body: emailbodyData,

    );


    if(response.statusCode==200)
      {

        return json.decode(response.body);
      }
    else
      {
        return false;
      }



  }
}
