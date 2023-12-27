import 'package:carrental/core/DB/DBCustomer.dart';
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
            child: ListView(
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CustomerHomeView()));
                    if (formkey.currentState!.validate()) {
                      DBCustomer.insertCustomer(customer);
                    } else {}
                  },
                  color: Colors.black,
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: "get all customsers",
                  ontap: () async {
                    await DBCustomer.printAllCustomersInfo();
                  },
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
