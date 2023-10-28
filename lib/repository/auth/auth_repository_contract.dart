import 'package:e_commerece_error/api/response/LoginResponse.dart';
import 'package:e_commerece_error/api/response/RegisterResponse.dart';
import 'package:e_commerece_error/repository/auth/data_source/auth_remote_datasource_impl.dart';
import 'package:e_commerece_error/repository/auth/repo/auth_repository_impl.dart';

abstract class AuthRepositoryContract{
  Future<String?> register(String name,String email,String phone,String password,String rePassword);
  Future<String?> login(String email,String password);
}

abstract class AuthRemoteDataSource{
  Future<RegisterResponse> register(String name,String email,String phone,String password,String rePassword);
  Future<LoginResponse> login(String email,String password);
}


AuthRepositoryContract injectAuthRepository(){
  return AuthRepositoryImpl(injectAuthRemoteDataSource());
}