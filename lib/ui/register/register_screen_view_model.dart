import 'package:e_commerece_error/repository/auth/auth_repository_contract.dart';
import 'package:e_commerece_error/ui/register/register_navigator.dart';
import 'package:flutter/material.dart';

class RegisterScreenViewModel extends ChangeNotifier{
  late RegisterNavigator navigator;
  AuthRepositoryContract repositoryContract ;
  RegisterScreenViewModel(this.repositoryContract);
  void register(String name,String email,String phone,String password,String rePassword)async{
    navigator.showLoading();
    try{
      var response = await repositoryContract.register(name, email, phone, password, rePassword);
      if(response == null){
        // navigator.hideLoading();
        // navigator.showMessage(response ?? 'error',
        //     posActionTitle: 'OK',
        // );
      }else{
        navigator.hideLoading();
        navigator.showMessage('Register Successfully \n ${response}',
        posActionTitle: 'OK',
          posAction: (){

          }
        );
      }
    }catch(e){
      navigator.hideLoading();
      navigator.showMessage(e.toString());
    }
  }
}