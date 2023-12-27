import 'package:carrental/constants.dart';
import 'package:carrental/core/DB/DBCustomer.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/methods/show_snack_bar.dart';
import 'package:carrental/core/utils/assets.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:carrental/features/admin/AdminHomeView.dart';
import 'package:carrental/features/carOwner/CarOwnwerauth/CarOwnerauth_cubit.dart';
import 'package:carrental/features/carOwner/addCarOwner.dart';
import 'package:carrental/features/customer/CustomerHomeView.dart';
import 'package:carrental/features/customer/addCustomerView.dart';
import 'package:carrental/features/carOwner/CarOwnerHomeView.dart';
import 'package:carrental/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  String? email;
  String? password;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CarOwnerAuthCubit, CarOwnwerauthState>(
      listener: (context, state) {
        if (state is CarOwnwerauthLoading) {
          isLoading = true;
        } else if (state is CarOwnwerauthSuccess) {
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
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
                      onchanged: (data) {
                        email = data;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomTextField(
                      hinttext: 'Password',
                      onchanged: (data) {
                        password = data;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      text: 'Log in',
                      ontap: () async {
                        if (iscustomer) {
                          if (formkey.currentState!.validate()) {
                            if (await DBCustomer
                                .isCustomerFoundByEmailAndPassword(
                                    email!, password!)) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CustomerHomeView(),
                                ),
                              );
                            } else {
                              showmySnackBar(context, "User is not found");
                            }
                          }
                        } else if (isAdmin) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminHomeView(),
                            ),
                          );
                        } else if (isCarOwner) {
                          if (formkey.currentState!.validate()) {
                            bool found =
                                await BlocProvider.of<CarOwnerAuthCubit>(
                                        context)
                                    .isUserFound(email!, password!);
                            if (found) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CarOwnerHomeView(),
                                ),
                              );
                            } else {
                              showmySnackBar(context, "User is not found");
                            }
                          }
                        }
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
                            if (iscustomer) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddCustomerView()));
                            } else if (isAdmin) {
                            } else if (isCarOwner) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddCarOwnerView()));
                            }
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
      ),
    );
  }
}
