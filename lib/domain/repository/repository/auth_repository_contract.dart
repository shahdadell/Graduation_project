import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/entities/RegisterResponseEntity.dart';
import 'package:graduation_project/domain/entities/auth_result_entity.dart';
import 'package:graduation_project/domain/entities/faliures.dart';

abstract class AuthRepositoryContract {
  Future<Either<Faliures,AuthResultEntity>> register(
      String username, String password, String email, String phone);
  Future<Either<Faliures,AuthResultEntity>> login(
       String password, String email);


}
