import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/linked_text.dart';
import '../widgets/logo.dart';
import '../widgets/textField.dart';
import '../widgets/title.dart';
import 'sign_up.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.white,
      body:  Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            
               const Logo(width: 144, height: 50, fontSize: 48),
                 const BigTitle(text: "Sign into your account"),
                 CustomTextField(name: "Email" ,controller: nameController, hintText: "ex: jon.smith@email.com"),
                 CustomTextField(name: "Password", controller: passwordController, hintText: "********"),
                  const CustomButton(name: 'SIGN IN'),
                  const SizedBox(height: 40),
                 const LinkedText(description: "Don’t have an account?", linkedText: " SIGN UP", navigateTo: SignUp()),
        
          ],
        ),
      ),
    );
  }
}