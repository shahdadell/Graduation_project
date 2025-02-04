import 'dart:convert';
import 'package:graduation_project/data/api/api_constance.dart';
import 'package:graduation_project/data/model/HomeScreen.dart';
import 'package:graduation_project/data/model/request/RegisterRequest.dart';
import 'package:graduation_project/data/model/response/RegisterResponse.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();
  static ApiManager? _instance ;
  static ApiManager getInstance(){
    _instance ??= ApiManager._();
    return _instance! ;
  }

  Future<RegisterResponse> register(
      String username, String password, String email, String phone) async {
    //https://abdulrahmanantar.com/outbye/auth/signup.php
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
    var requestBody = RegisterRequest(
      username: username,
      email: email,
      password: password,
      phone: phone,
    );
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<HomeScreen> getSources() async {
    Uri url = Uri.https(
      ApiConstants.baseUrlHome,
      ApiConstants.homeApi,
    );
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return HomeScreen.fromJson(json);
    } catch (e){
      throw e ;
    }
  }
}
