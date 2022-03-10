import 'package:boutique/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:boutique/view/widgets/form_button.dart';
import 'package:boutique/view/widgets/form_inputs.dart';
import 'package:boutique/res/strings.dart';
import 'package:boutique/view/screens/widgets/auth.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _emailController = TextEditingController(text: '');
    var _passwordController = TextEditingController(text: '');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Container(
            height: 460,
            width: 420,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthTitle(
                  title: signIn,
                ),
                FormInput(
                    controller: _emailController,
                    label: emailLabel,
                    hint: emailHint,
                    inputType: TextInputType.emailAddress),
                FormInput(
                    controller: _passwordController,
                    label: passwordLabel,
                    hint: passwordHint,
                    inputType: TextInputType.visiblePassword),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Forgot Password?'),
                ),
                FormButton(
                  text: signIn,
                  onPressed: () => LoginController()
                      .signIn(_emailController.text, _passwordController.text),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
