import 'package:graduation_project/data/api/api_manager.dart';
import 'package:graduation_project/data/model/response/RegisterResponse.dart';
import 'package:graduation_project/domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<RegisterResponse> register(
      String username, String password, String email, String phone) async {
    var response = await apiManager.register(username, password, email, phone);
    return response;
  }

}
AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());

}
