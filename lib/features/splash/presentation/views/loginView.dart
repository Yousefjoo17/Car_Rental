import 'package:carrental/constants.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:carrental/features/customer/presentation/views/CustomerHomeView.dart';
import 'package:carrental/features/splash/presentation/views/registerView.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();

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
                  const SizedBox(height: 60),
                  Image.asset(
                    AssetsData.car2,
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'carRental',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Caveat',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  const Row(
                    children: [],
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
                  CustomButton(
                    text: 'Log in',
                    ontap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CustomerHomeView(),
                        ),
                      );
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
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterView(),
                            ),
                          );
                        },
                        child: const Text(
                          'Register ',
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
