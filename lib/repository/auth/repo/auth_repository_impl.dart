import 'package:e_commerece_error/repository/auth/auth_repository_contract.dart';

class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl(this.remoteDataSource);
  @override
  Future<String?> login(String email, String password)async {
    var response = await remoteDataSource.login(email, password);
    return response.token ;
  }

  @override
  Future<String?> register(String name, String email, String phone, String password, String rePassword)async {
    var response = await remoteDataSource.register(name, email, phone, password, rePassword);
    return response.token;
  }
  
}