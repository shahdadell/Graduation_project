import 'package:graduation_project/data/model/response/RegisterResponse.dart';
import 'package:graduation_project/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:graduation_project/domain/repository/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract ;
  RegisterUseCase({required this.repositoryContract});

  Future<RegisterResponse>invoke(String username, String password, String email, String phone){
    return repositoryContract.register(username, password, email, phone);
  }
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}
