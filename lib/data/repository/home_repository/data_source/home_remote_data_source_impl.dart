import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/api/api_manager.dart';
import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';
import 'package:graduation_project/domain/entities/faliures.dart';
import 'package:graduation_project/domain/repository/data_source/Hohome_remote_data_source.dart';


class HomeRemoteDataSourceImpl implements HomeRemoteDataSource{
  ApiManager apiManager ;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<Faliures, CategoryResponseEntity>> getAllCategories() async{
    var either = await apiManager.getAllCategories();
    return either.fold((l) {
      return Left(Faliures(errorMessage: l.errorMessage));
    }, (response) {
      return Right(response.toCategoryEntity());
    });

  }
}