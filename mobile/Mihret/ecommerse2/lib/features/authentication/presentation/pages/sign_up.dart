import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/linked_text.dart';
import '../widgets/logo.dart';
import '../widgets/textField.dart';
import '../widgets/title.dart';
import 'sign_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController(text: '');
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: '');
    TextEditingController confirmPasswordController = TextEditingController(text: '');
    return Scaffold(
      appBar: AppBar(actions: [Logo(width: 60, height: 25,fontSize: 24)],),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BigTitle(text: "Create an account"),
            CustomTextField(name: 'Name', controller: nameController, hintText: 'ex: jon smith'),
            CustomTextField(name: 'Email', controller: emailController, hintText: 'ex: jon.smith@email.com'),
            CustomTextField(name: 'Password', controller: passwordController, hintText: '*********'),
            CustomTextField(name: 'Confirm Password', controller: confirmPasswordController, hintText: '*********'),
            const CustomButton(name: "SIGN UP"),
            const LinkedText(description: "Have an account? ", linkedText: "SIGN IN", navigateTo: SignIn())
        
          ],
        ),
      )
    );
  }
}