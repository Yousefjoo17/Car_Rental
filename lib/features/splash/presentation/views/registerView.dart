import 'package:carrental/constants.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  String? passwordAssertion;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Container(
          decoration: customBoxDecoration(
              [kprimaryColor3, kprimaryColor1, kprimaryColor0]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formkey,
              child: ListView(
                children: [
                  const SizedBox(height: 15),
                  Image.asset(
                    AssetsData.car2,
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Car rental',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Caveat',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hinttext: 'Email',
                    onchanged: (data) {},
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hinttext: 'Password',
                    onchanged: (data) {},
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hinttext: 'Re enter password',
                    onchanged: (data) {
                      passwordAssertion = data;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    text: 'Register',
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                      } else {}
                    },
                    color: kprimaryColor3,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Log in ',
                          style: TextStyle(color: Colors.blue),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
