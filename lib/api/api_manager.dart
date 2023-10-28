import 'dart:convert';
import 'package:e_commerece_error/api/api_constants.dart';
import 'package:e_commerece_error/api/request/LoginRequest.dart';
import 'package:e_commerece_error/api/request/RegisterRequest.dart';
import 'package:e_commerece_error/api/response/LoginResponse.dart';
import 'package:e_commerece_error/api/response/RegisterResponse.dart';
import 'package:http/http.dart' as http ;

class ApiManager{

  // private constructor
  ApiManager._();
  static ApiManager? _instance ;

  static ApiManager getInstance(){
    _instance ??= ApiManager._();
    return _instance! ;
  }

  Future<RegisterResponse> register(String name,String email,String phone,String password,String rePassword)async{
    Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.registerApi);
    var requestBody = RegisterRequest(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone
    );
    var response = await http.post(url,body: requestBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  Future<LoginResponse> login(String email,String password)async{
    var url = Uri.https(ApiConstants.baseUrl,ApiConstants.loginApi);
    var requestBody = LoginRequest(
      email: email,
      password: password
    );
    var response = await http.post(url,body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}