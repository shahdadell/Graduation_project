import 'package:graduation_project/data/api/api_manager.dart';
import 'package:graduation_project/data/repository/auth_repository/data_source/auth_remote_data_source_impl.dart';
import 'package:graduation_project/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:graduation_project/data/repository/home_repository/home_repositiry_impl.dart';
import 'package:graduation_project/domain/repository/data_source/Hohome_remote_data_source.dart';
import 'package:graduation_project/domain/repository/data_source/auth_remote_data_source.dart';
import 'package:graduation_project/domain/repository/repository/auth_repository_contract.dart';
import 'package:graduation_project/domain/repository/repository/home_reposatiory_concract.dart';
import 'package:graduation_project/domain/use_case/get_all_categories_usecase.dart';
import 'package:graduation_project/domain/use_case/login_use_case.dart';
import 'package:graduation_project/domain/use_case/register_use_case.dart';

import '../data/repository/home_repository/data_source/home_remote_data_source_impl.dart';


AuthRepositoryContract injectAuthRepositoryContract() {
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSource injectAuthRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
LoginUseCase injectLoginUseCase() {
  return LoginUseCase(repositoryContract: injectAuthRepositoryContract());
}
RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(repositoryContract: injectAuthRepositoryContract());
}
GetAllCategoriesUseCase injectGetAllCategoriesUseCase() {
  return GetAllCategoriesUseCase(repositoryContract: injectHomeRepositoryContract());
}

HomeRepositoryContract injectHomeRepositoryContract() {
  return HomeRepositoryImpl(remoteDataSource: injectHomeRemoteDataSource());
}
HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}