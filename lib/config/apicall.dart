// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, prefer_final_fields

import 'package:dazllapp/UI/login/login_screen.dart';
import 'package:dazllapp/config/api.dart';
import 'package:dazllapp/config/global.dart';
import 'package:dazllapp/constant/spkeys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../UI/homepage/customer/home/customer_homepage.dart';
import '../UI/homepage/professional/professionals_homepage.dart';
import '../UI/homepage/realtor/realtor_homepage.dart';

// login
bool islogin = false;
bool loading = false;
int? realtorid;

class CustomInterCeptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (sharedPreferences.containsKey(SharedPrefsKeys.key_token)) {
      String _user_Token =
          sharedPreferences.getString(SharedPrefsKeys.key_token)!;

      options.headers = {'Authorization': "Bearer ${_user_Token}"};
    }

    // print(user_Token);
    // options.headers = {'Authorization': "Bearer ${temporaryToken}"};
    super.onRequest(options, handler);
  }
}

class DioClient {
  Dio _dio = Dio(BaseOptions(baseUrl: base_url))
    ..interceptors.add(CustomInterCeptor());
  Future<dynamic> getRequest(
      {required String apiEnd, Map<String, dynamic>? queryParameter}) async {
    try {
      final res = await _dio.get(apiEnd, queryParameters: queryParameter);
      return res;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<dynamic> PostwithFormData(
      {required String apiEnd, Map<String, dynamic>? Data}) async {
    try {
      final res = await _dio.post(apiEnd, data: Data);
      return res;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<dynamic> FormData({required String apiEnd, Data}) async {
    try {
      final res = await _dio.post(apiEnd, data: Data);
      return res;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<dynamic> rawwithFormData(
      {required String apiEnd, List<Map<String, dynamic>>? Data}) async {
    try {
      final res = await _dio.post(apiEnd, data: Data);
      return res;
    } on DioError catch (e) {
      return e.response;
    }
  }
}

Dio dio = Dio(BaseOptions(baseUrl: base_url));
Future<String> login(index, email, password, context, keepmelogin) async {
  SpHelpers.setBool(SharedPrefsKeys.key_keep_me_logged_in, keepmelogin);
  SpHelpers.setInt(SharedPrefsKeys.key_current, index);
  String url = login_realtor;
  try {
    switch (index) {
      case 0:
        index == 0;
        url = login_realtor;
        break;
      case 1:
        index == 1;
        url = login_professional;
        break;
      case 2:
        index == 2;
        url = login_customer;
        break;

      default:
    }

    final response = await dio.post(url,
        // curruntindex == 0
        //     ? login_realtor
        //     : curruntindex == 1
        //         ? login_professional
        //         : curruntindex == 2
        //             ? login_realtor
        //             : "",
        data: {
          "email": email,
          "password": password,
        });
    print(response.data);
    if (response.statusCode == 200) {
      SpHelpers.setPref(
          SharedPrefsKeys.Realtor_id, response.data['data']['id'].toString());

      SpHelpers.setPref(
          SharedPrefsKeys.Prof_id, response.data['data']['id'].toString());

      SpHelpers.setPref(
          SharedPrefsKeys.key_token, response.data['data']['token']);

      islogin = true;
      // log("Pro Id=" + SpHelpers.getString(SharedPrefsKeys.Prof_id).toString());
      //SpHelpers.setString();
      if (index == 0) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => RealtorHomePage()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Login Sucessfully'), backgroundColor: Colors.green));
      } else if (index == 1) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ProfessionalsHomepage()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login Sucessfully'),
          backgroundColor: Colors.green,
        ));
      } else if (index == 2) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => CustomerHomepage()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Login Sucessfully'), backgroundColor: Colors.green));
      }
      loading = false;
    } else {
      print('fail');
    }
  } catch (e) {
    //print((e as DioError).response!.data.toString());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text((e as DioError).response!.data['message']),
        backgroundColor: Colors.red));
  }
  return "";
}

//logout
logOut(BuildContext context) async {
  islogin = false;
  SpHelpers.removePref();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove(SharedPrefsKeys.key_token);
  await prefs.remove(SharedPrefsKeys.key_current);
  await prefs.remove(SharedPrefsKeys.key_keep_me_logged_in);
  await prefs.remove(SharedPrefsKeys.Prof_id);
  await prefs.remove(SharedPrefsKeys.Realtor_id);
  print("Log out successfully");

  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen(index: 0)),
      (route) => false);
}

//sign up

Future<void> signupRealtor(
  index,
  context,
  address1,
  confirm_password,
  email,
  fname,
  lname,
  password,
  mobile,
  address,
) async {
  try {
    final response = await dio.post(signup_realtor, data: {
      "check_box": true,
      "city_of_real_state_agency": address1,
      "confirm_password": confirm_password,
      "email": email,
      "first_name": fname,
      "last_name": lname,
      "password": password,
      "phone_number": mobile,
      "real_state_agency_name": address,
      "state": "test",
      "zip_code": "1234"
    });

    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen(
                    index: 0,
                  )));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registerd Sucessfully'),
          backgroundColor: Colors.green));
    } else {
      print('fail');
    }
  } catch (e) {
    //print((e as DioError).response!.data.toString());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text((e as DioError).response!.data['message']),
        backgroundColor: Colors.red));
  }
}

Future<void> signupProfessional({
  required int index,
  required BuildContext context,
  required String city,
  required String company_name,
  required String company_address,
  required String confirm_password,
  required String email,
  required String fname,
  required String lname,
  required String password,
  required String company_number,
  required String facebookLink,
  required String image1,
  required String image2,
  required String image3,
  required String image4,
  required List<int> services,
  required String insurance,
  required String state,
  required String twitterLink,
  required String website,
  required String zip_code,
  required String years,
  required String numberIns,
  required String contactIns,
  required String mobile,
}) async {
  try {
    final response = await dio.post(signup_professional, data: {
      "check_box": true,
      "company_city": city,
      "company_name": company_name,
      "company_number": company_number,
      "company_street_address": company_address,
      "confirm_password": confirm_password,
      "contactIns": contactIns,
      "email": email,
      "fb": facebookLink,
      "first_name": fname,
      "images1": image1,
      "images2": image2,
      "images3": image3,
      "images4": image4,
      "insurance": insurance,
      "last_name": lname,
      "numberIns": numberIns,
      "password": password,
      "phone_number": mobile,
      "services": services,
      "state": state,
      "twitter": twitterLink,
      "website": website,
      "years": years,
      "zip_code": zip_code
    });

    if (response.statusCode == 201) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen(
                    index: 0,
                  )));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registerd Sucessfully'),
          backgroundColor: Colors.green));
    } else {
      print('fail');
    }
  } catch (e) {
    // print((e as DioError).response!.data.toString());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text((e as DioError).response!.data['message']),
        backgroundColor: Colors.red));
  }
}

Future<void> signupCustomer(
  index,
  context,
  confirm_password,
  email,
  fname,
  lname,
  password,
  mobile,
) async {
  try {
    final response = await dio.post(signup_customer, data: {
      "check_box": true,
      "confirm_password": confirm_password,
      "email": email,
      "first_name": fname,
      "last_name": lname,
      "password": password,
      "phone_number": mobile,
      "zip_code": "1234"
    });
    if (response.statusCode == 201) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => LoginScreen(
                    index: 0,
                  )));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Registerd Sucessfully'),
          backgroundColor: Colors.green));
    } else {
      print('fail');
    }
  } catch (e) {
    //print((e as DioError).response!.data.toString());
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text((e as DioError).response!.data['message']),
        backgroundColor: Colors.red));
  }
}

//forgot

Future<String> forgotpassword(email, String text) async {
  try {
    final response = await dio.post(forgot_password, data: {
      "email": email,
    });
    if (response.statusCode == 201) {
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text('Registerd Sucessfully'),
      //     backgroundColor: Colors.green));
    } else {
      print('fail');
    }
  } catch (e) {
    //print((e as DioError).response!.data.toString());
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text((e as DioError).response!.data['message']),
    //     backgroundColor: Colors.red));
  }
  return "";
}
