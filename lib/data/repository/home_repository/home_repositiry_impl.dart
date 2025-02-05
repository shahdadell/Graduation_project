import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/entities/CategoryResponseEntity.dart';
import 'package:graduation_project/domain/entities/faliures.dart';
import 'package:graduation_project/domain/repository/data_source/Hohome_remote_data_source.dart';
import 'package:graduation_project/domain/repository/repository/home_reposatiory_concract.dart';

class HomeRepositoryImpl implements HomeRepositoryContract{
  HomeRemoteDataSource remoteDataSource ;
  HomeRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Faliures, CategoryResponseEntity>> getAllCategories() {
    return remoteDataSource.getAllCategories();
  }

}