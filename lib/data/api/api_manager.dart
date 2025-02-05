import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/api/api_constance.dart';
import 'package:graduation_project/data/model/request/LoginRequest.dart';
import 'package:graduation_project/data/model/request/RegisterRequest.dart';
import 'package:graduation_project/data/model/response/CategoryResponseDTO.dart';
import 'package:graduation_project/data/model/response/LoginResponseDTO.dart';
import 'package:graduation_project/data/model/response/RegisterResponseDTO.dart';
import 'package:graduation_project/domain/entities/faliures.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Faliures, RegisterResponseDTO>> register(
      String username, String password, String email, String phone) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
      var requestBody = RegisterRequest(
        username: username,
        email: email,
        password: password,
        phone: phone,
      );
      var response = await http.post(url, body: requestBody.toJson());
      var registerResponse =
      RegisterResponseDTO.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(
          Faliures(
              errorMessage: registerResponse.status != null
                  ? registerResponse.message!
                  : registerResponse.message),
        );
      }
    }
  }

  Future<Either<Faliures, LoginResponseDTO>> login(
      String password, String email) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.loginApi);
      var requestBody = LoginRequest(
        email: email,
        password: password,
      );
      var response = await http.post(url, body: requestBody.toJson());
      var loginResponse = LoginResponseDTO.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(
          Faliures(
              errorMessage: loginResponse.status != null
                  ? loginResponse.message!
                  : loginResponse.message),
        );
      }
    } else {
      return Left(Faliures(errorMessage: 'Check Internet Connection'));
    }
  }

  /// 🔹 **إضافة `getAllCategories` داخل `ApiManager`**
  Future<Either<Faliures, CategoryResponseDto>> getAllCategories() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
      Uri.https(ApiConstants.baseUrl, ApiConstants.getAllCategoriesApi);
      var response = await http.get(url);
      var categoryResponse =
      CategoryResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(categoryResponse);
      } else {
        return Left(
          Faliures(errorMessage: categoryResponse.message),
        );
      }
    } else {
      return Left(Faliures(errorMessage: 'Check Internet Connection'));
    }
  }
}


