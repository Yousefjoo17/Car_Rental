import 'package:carrental/core/DB/DBCustomer.dart';
import 'package:carrental/core/methods/show_snack_bar.dart';
import 'package:carrental/core/models/customser.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:carrental/features/customer/CustomerHomeView.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddCustomerView extends StatefulWidget {
  const AddCustomerView({super.key});

  @override
  State<AddCustomerView> createState() => _AddCustomerViewState();
}

class _AddCustomerViewState extends State<AddCustomerView> {
  Customer customer = Customer();
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
                    "insert customser",
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "Email",
                    onchanged: (p0) {
                      customer.email = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "password",
                    onchanged: (p0) {
                      customer.password = p0;
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
                    hinttext: "First name",
                    onchanged: (p0) {
                      customer.firstName = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "Last name",
                    onchanged: (p0) {
                      customer.lastName = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "address",
                    onchanged: (p0) {
                      customer.address = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "Driving licesnse",
                    onchanged: (p0) {
                      customer.drivingLicense = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hinttext: "national ID",
                    onchanged: (p0) {
                      customer.natId = p0;
                    },
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    text: "register",
                    ontap: () async {
                      if (formkey.currentState!.validate()) {
                        if (passwordAssertion == customer.password) {
                          if (await DBCustomer.isEmailFound(customer.email!) ||
                              await DBCustomer.isNatIdFound(customer.natId!)) {
                            showmySnackBar(
                                context, "email and nationl ID must be unique");
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomerHomeView()));
                            DBCustomer.insertCustomer(customer);
                            await DBCustomer.printAllCustomersInfo();
                          }
                        }
                      }
                    },
                    color: Colors.black,
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
