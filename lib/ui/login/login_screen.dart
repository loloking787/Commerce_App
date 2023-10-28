import 'package:e_commerece_error/dialog_utils.dart';
import 'package:e_commerece_error/repository/auth/auth_repository_contract.dart';
import 'package:e_commerece_error/ui/login/login_navigator.dart';
import 'package:e_commerece_error/ui/login/login_screen_view_model.dart';
import 'package:e_commerece_error/ui/register/register_screen.dart';
import 'package:e_commerece_error/ui/widgets/custom_button.dart';
import 'package:e_commerece_error/ui/widgets/custom_text_form_field.dart';
import 'package:e_commerece_error/ui/widgets/form_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login' ;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  LoginScreenViewModel viewModel = LoginScreenViewModel(injectAuthRepository());

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this ;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginScreenViewModel>(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Image.asset('assets/images/route.png'),
                  SizedBox(
                    height: 86,
                  ),
                  Text('Welcome Back To Route',
                  style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  FormLabelWidget(label: 'Email Address'),
                  SizedBox(height: 24,),
                  CustomTextFormField(
                      hintText: 'enter your email address',
                      controller: emailController,
                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'Please enter email';
                        }
                        var emailValid =  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if(!emailValid){
                          return 'email format not valid' ;
                        }
                        return null ;
                      },
                      type: TextInputType.emailAddress),
                  SizedBox(height: 32,),
                  FormLabelWidget(label: 'Password'),
                  SizedBox(height: 24,),
                  CustomTextFormField(
                      hintText: 'enter your password',
                      controller: passwordController,
                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'Please enter password';
                        }
                        if(text.length < 6){
                          return 'Password should be at least 6 chrs';
                        }
                      },
                      type: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  SizedBox(height: 16,),
                  InkWell(
                    onTap: (){},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FormLabelWidget(label: 'Forget Password',),
                    ),
                  ),
                  SizedBox(height: 56,),
                  CustomButtonWidget(title: 'Login', onPressed: (){
                    login();
                  }),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FormLabelWidget(label: "Don't have an account ?"),
                      SizedBox(width: 5,),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        },
                        child: FormLabelWidget(label: 'Create Account'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    DialogUtils.hideDialog(context);
  }

  @override
  void showLoading() {
    DialogUtils.showProgressDialog(context, 'Loading...');
  }

  @override
  void showMessage(String message, {String? posActionTitle, VoidCallback? posAction, String? negActionTitle, VoidCallback? negAction, bool isDismissible = true}) {
    DialogUtils.showMessage(context, message,
    isDismissible: isDismissible,
      negActionTitle: negActionTitle,
      negAction: negAction,
      posActionTitle: posActionTitle,
      posAction: posAction,

    );
  }

  void login() {
    if(formKey.currentState?.validate() == false){
      return ;
    }
    viewModel.login(emailController.text, passwordController.text);
  }
}
