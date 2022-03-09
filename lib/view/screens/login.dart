import 'package:flutter/material.dart';

import '../widgets/form_button.dart';
import '../widgets/form_inputs.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController(text: '');
    var _passwordController = TextEditingController(text: '');
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          height: 420,
          width: 420,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              FormInput(
                  controller: _emailController,
                  label: 'Email Address',
                  hint: 'Enter email address',
                  inputType: TextInputType.emailAddress),
              FormInput(
                  controller: _emailController,
                  label: 'Password',
                  hint: 'Enter your password',
                  inputType: TextInputType.visiblePassword),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Forgot Password?'),
              ),
              FormButton(
                text: 'Sign In',
                onPressed: pressMe,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void pressMe() {
    print('This is my message for viewers');
  }
}
