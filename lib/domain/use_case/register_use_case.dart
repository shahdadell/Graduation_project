import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/response/RegisterResponseDTO.dart';
import 'package:graduation_project/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:graduation_project/domain/entities/auth_result_entity.dart';
import 'package:graduation_project/domain/entities/faliures.dart';
import 'package:graduation_project/domain/repository/repository/auth_repository_contract.dart';

class RegisterUseCase {
  AuthRepositoryContract repositoryContract;
  RegisterUseCase({required this.repositoryContract});

  Future<Either<Faliures, AuthResultEntity>> invoke(
       String password, String email , String phone , String userName) {
    return repositoryContract.register(password, email ,password , userName);
  }
}


