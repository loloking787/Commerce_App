import 'package:e_commerece_error/api/response/LoginResponse.dart';
import 'package:e_commerece_error/api/response/RegisterResponse.dart';
import 'package:e_commerece_error/repository/auth/auth_repository_contract.dart';
import 'package:e_commerece_error/api/api_manager.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  ApiManager apiManager ;
  AuthRemoteDataSourceImpl(this.apiManager);
  @override
  Future<RegisterResponse> register(String name, String email, String phone, String password, String rePassword)async {
    var response = await apiManager.register(name, email, phone, password, rePassword);
    return response ;
  }

  @override
  Future<LoginResponse> login(String email, String password)async {
    var response = await apiManager.login(email, password);
    return response ;
  }
  
}
AuthRemoteDataSource injectAuthRemoteDataSource(){
  return AuthRemoteDataSourceImpl(ApiManager.getInstance());
}