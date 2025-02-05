import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/api/api_manager.dart';
import 'package:graduation_project/domain/entities/auth_result_entity.dart';
import 'package:graduation_project/domain/entities/faliures.dart';
import 'package:graduation_project/domain/repository/data_source/auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Faliures, AuthResultEntity>> register(
      String username, String password, String email, String phone) async {
    var either = await apiManager.register(username, password, email, phone);
    return either.fold((l) {
      return Left(Faliures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }

  @override
  Future<Either<Faliures, AuthResultEntity>> login(
      String password, String email) async {
    var either = await apiManager.login(password, email);
    return either.fold((l) {
      return Left(Faliures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toAuthResultEntity());
    });
  }
}


