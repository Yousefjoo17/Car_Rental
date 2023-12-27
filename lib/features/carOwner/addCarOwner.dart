import 'package:carrental/core/DB/DBCarOwners.dart';
import 'package:carrental/core/methods/show_snack_bar.dart';
import 'package:carrental/core/models/carOwner.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:carrental/features/carOwner/CarOwnerHomeView.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddCarOwnerView extends StatefulWidget {
  const AddCarOwnerView({super.key});

  @override
  State<AddCarOwnerView> createState() => _AddCarViewState();
}

class _AddCarViewState extends State<AddCarOwnerView> {
  CarOwner carOwner = CarOwner();
  bool isLoading = false;
  GlobalKey<FormState> formkey = GlobalKey();
  String? passwordAssertion;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    " Insert an Owner",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "email",
                    onchanged: (p0) {
                      carOwner.email = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "password",
                    onchanged: (p0) {
                      carOwner.password = p0;
                    },
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    hinttext: 'Re enter password',
                    onchanged: (data) {
                      passwordAssertion = data;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "first",
                    onchanged: (p0) {
                      carOwner.firstName = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "last",
                    onchanged: (p0) {
                      carOwner.lastName = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "price for rent",
                    onchanged: (p0) {
                      carOwner.paymentPerMonth = int.parse(p0);
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "Current city",
                    onchanged: (p0) {
                      carOwner.address = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "registeration info",
                    onchanged: (p0) {
                      carOwner.password = p0;
                      carOwner.natID = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: "Register",
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        if (passwordAssertion == carOwner.password) {
                          if (await DBCarOwner.isEmailFound(carOwner.email!) ||
                              await DBCarOwner.isNatIdFound(carOwner.natID!)) {
                            showmySnackBar(context,
                                "Either Email or Id is inserted before");
                          }
                        } else {
                          
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CarOwnerHomeView()));
                          DBCarOwner.insertCarOwner(carOwner);
                          await DBCarOwner.printAllCarOwnersInfo();
                        }
                      } else {
                        showmySnackBar(context, "Password mismatch");
                      }
                    },
                    color: Colors.black,
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
