import 'package:graduation_project/data/response/RegisterResponse.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(
      String username, String password, String email, String phone);

}
