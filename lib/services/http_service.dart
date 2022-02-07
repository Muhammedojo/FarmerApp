import 'dart:async';
import 'dart:convert';
import '../models/login_model.dart';
import 'package:dio/dio.dart';
import '../models/cooperative.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HttpService {
  late Dio _dio;

  final _baseUrl = 'https://wb-staging.afexnigeria.com/WB3/api/v1/';
  Future<SharedPreferences> sharedPreferences()  async => await SharedPreferences.getInstance();



  HttpService() {
    _dio = Dio();
    _dio.options.connectTimeout = 5000;
    _dio.options.receiveTimeout = 5000;
    _dio.options.baseUrl = _baseUrl;

    //addInterceptors();
  }


  Future<UserDetailsModel?> login(String username, String password) async {
    final data = {
      "username": username,
      "password": password,
      "device_id": "",
    };
    try {
      Response response;

      response =
      await _dio.post("api-token-auth/", data: data, options: Options(
          contentType: "application/json"),);

      if (response.statusCode == 200) { ///success response from server
        final body = UserDetailsModel.fromJson(response.data);
       // print("response code: ${body.responseCode}");
        // print("response code: ${body.message}");
        // print("response code: ${body.username}");
        // print(data);

        return body;
      } else {
        return UserDetailsModel(message: response.statusMessage);
      }
    } catch (e) {
     // print(e.toString());
      return UserDetailsModel(username: null,
          token: null,
          responseCode: "103",
          message: e.toString());
    }
  }

  Future<Cooperative?> getCooperative({required String id}) async {
    Cooperative? cooperative;
    try {
      Response userData = await _dio.get(_baseUrl + 'cooperatives/');
      //print('User Info: ${userData.data}');
      cooperative = Cooperative.fromJson(userData.data);
    } on DioError catch (e) {

      if (e.response != null) {
        // print('Dio error!');
        // print('STATUS: ${e.response?.statusCode}');
        // print('DATA: ${e.response?.data}');
        // print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        // print('Error sending request!');
        // print(e.message);

      }
    }
    return cooperative;
  }

  Future<UserModel?> getUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    final token = storage.getString('TOKEN');
    final email = storage.getString('EMAIL');
    if (token != null && email != null) {
      return UserModel(username: email, token: token,);
    } else {
      return null;
    }
  }

  // get request for dio
  Future<Response> getRequest(String endpoint) async {
    var headers = await getHeader();
    return await _dio.get(_baseUrl, options: Options(headers: headers));
  }

  //Post Request for dio
  Future<Response> postRequest(String endPoint, dynamic body) async {
    //insert headers
    var headers = await getHeader();
    return await _dio.post(_baseUrl,
        data: jsonEncode(body),
        options: Options(contentType: "application/json", headers: headers));
  }

  Future<void> saveToken(String token) async {
    await sharedPreferences().then((value) => value.setString('token', token));
  }

  Future<String?> getToken() async {
    return await sharedPreferences().then((value) => value.getString("token"));
  }





  //get headers(e
  Future<Map<String, String>> getHeader() async {
    String? token = await getToken() ?? "";
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'WB3 $token'
    };
    return requestHeaders;
  }

}

