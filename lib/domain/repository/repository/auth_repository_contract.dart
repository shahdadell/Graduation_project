
import 'package:graduation_project/data/model/response/RegisterResponse.dart';

abstract class AuthRepositoryContract {
  Future<RegisterResponse> register(
      String username, String password, String email, String phone);


}
