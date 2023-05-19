import 'dart:convert';

import 'package:cofinex/data_model/model/currency_list_model.dart';
import 'package:cofinex/data_model/model/deposit_details.dart';
import 'package:cofinex/data_model/model/get_otp_model.dart';
import 'package:cofinex/data_model/model/network_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class APIUtils {
  final appName = 'Cofinex';
  static const initURL = "https://dataapi.cofinex.io/";
  static const authURL = "https://auth.cofinex.io/";
  static const registerURL = "users/createUser";
  static const sentOTPURL = "users/generateOTP";
  static const fetchOTPURL = "users/getOTP";
  static const verifyEmailURL = "users/emailVerified";
  static const currencyURL = "currency/currency";
  static const networkURL = "currency/networks";
  static const addressURL = "users/getaddress";
  static const kycURL = "users/initKyc";
  static const fetchUserURL = "users/fetchuser";
  static const getTokenURL = "https://api.cofinex.in/encodewsheader";

  Future<dynamic> doRegisterEmail(
      String firstName,
      String lastName,
      String email,
      String countryISOCode,
      String password,
      String phoneNumber,
      String referralCode) async {
    var emailbodyData = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'countryISOCode': countryISOCode,
      'password': password,
      'phoneNumber': phoneNumber,
      'referralCode': referralCode
    };

    print("testiomg");

    final response = await http.post(
      Uri.parse(initURL + registerURL),
      body: emailbodyData,
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
      },
    );
    print(response.body);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
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

    final response = await http.post(
      Uri.parse(initURL + sentOTPURL),
      body: emailbodyData,
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
      },
    );

    return json.decode(response.body);
  }

  Future<GetOtpModel> fetchOTP(
    String userId,
  ) async {
    var emailbodyData = {
      'userId': userId,
      'action': "VERIFY_EMAIL",
    };

    final response = await http.post(
      Uri.parse(initURL + fetchOTPURL),
      body: emailbodyData,
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
      },
    );

    return GetOtpModel.fromJson(json.decode(response.body));
  }

  Future<dynamic> verifyEmail(
    String userId,
  ) async {
    var emailbodyData = {
      'userId': userId,
    };

    final response = await http.put(
      Uri.parse(initURL + verifyEmailURL),
      body: emailbodyData,
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
      },
    );

    return json.decode(response.body);
  }

  Future<dynamic> doLoginEmail(String email, String password) async {
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

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  Future<dynamic> generateToken() async {
    final response = await http.get(Uri.parse(
      getTokenURL,
    ));

    return json.decode(response.body);
  }

  Future<CurrencyListModel> getAllCurrency() async {
    final response = await http.get(
      Uri.parse(initURL + currencyURL),
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
      },
    );

    return CurrencyListModel.fromJson(json.decode(response.body));
  }

  Future<NetworkListModel> getAllNetworks() async {
    final response = await http.get(
      Uri.parse(initURL + networkURL),
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
      },
    );
    return NetworkListModel.fromJson(json.decode(response.body));
  }

  Future<dynamic> getDepositAddress(String token, String network) async {
    SharedPreferences preferences=await SharedPreferences.getInstance();
    var emailbodyData = {
      'token': token,
      'network': network,
    };

    final response = await http.post(
      Uri.parse(initURL + addressURL),
      body: emailbodyData,
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
        'Authorization': "Bearer "+preferences.getString("token").toString()
      },
    );

    return json.decode(response.body);
  }

  Future<dynamic> doChangePassword(String currentPassword, String newPassword,String confirmation) async {
    var emailbodyData = {
      'currentPassword': currentPassword,
      'password': currentPassword,

    };

    final response = await http.post(
      Uri.parse(authURL + "realms/{{realm}}/account/credentials/password"),
      body: emailbodyData,
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }
  Future<dynamic> getInitKYC() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();


    final response = await http.get(
      Uri.parse(initURL + kycURL),
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
        'Authorization': "Bearer "+preferences.getString("token").toString()
      },
    );

    return json.decode(response.body);
  }

  Future<dynamic> getUserDetails() async {
    SharedPreferences preferences=await SharedPreferences.getInstance();


    final response = await http.get(
      Uri.parse(initURL + fetchUserURL),
      headers: {
        'x-api-key': '29PTN4TiBOz4LPpP24k4vQd0C9fXWk',
        'Authorization': "Bearer "+preferences.getString("token").toString()
      },
    );

    return json.decode(response.body);
  }
}
