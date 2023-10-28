import 'package:e_commerece_error/repository/auth/auth_repository_contract.dart';
import 'package:e_commerece_error/ui/login/login_navigator.dart';
import 'package:flutter/material.dart';

class LoginScreenViewModel extends ChangeNotifier{
  AuthRepositoryContract repositoryContract ;
  late LoginNavigator navigator ;
  LoginScreenViewModel(this.repositoryContract);

  login(String email,String password)async{
    navigator.showLoading();
    try{
      var response = await repositoryContract.login(email, password);
      navigator.hideLoading();
      navigator.showMessage('Login Successfully \n ${response}',
          posActionTitle: 'OK',
          posAction: (){

          }
      );
    }catch(e){
      navigator.hideLoading();
      navigator.showMessage(e.toString());
    }
  }
}