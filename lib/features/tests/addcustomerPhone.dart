import 'package:carrental/core/DB/DBCustomerPhone.dart';
import 'package:carrental/core/models/customerPhoneEntery.dart';
import 'package:carrental/core/widgets/Custom_button.dart';
import 'package:carrental/core/widgets/Custom_text_field.dart';
import 'package:flutter/material.dart';

class AddCustomerPhone extends StatefulWidget {
  const AddCustomerPhone({super.key});

  @override
  State<AddCustomerPhone> createState() => _AddCustomerPhoneState();
}

class _AddCustomerPhoneState extends State<AddCustomerPhone> {
  CustomerPhone customerPhone = CustomerPhone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 50),
          const Text(
            "insert customser",
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          CustomTextField(
            hinttext: "address",
            onchanged: (p0) {
              customerPhone.custID =int.parse(p0);
            },
          ),
          const SizedBox(height: 30),
          CustomTextField(
            hinttext: "Driving licesnse",
            onchanged: (p0) {
              customerPhone.phone =p0;
            },
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          CustomButton(
            text: "add",
            ontap: () {
              DBCustomerPhone.insertCustomerPhone(customerPhone);
            },
            color: Colors.black,
          ),
          const SizedBox(height: 30),
          CustomButton(
            text: "get all customsers",
            ontap: () async {
              await DBCustomerPhone.printAllCustomerPhonesInfo();
            },
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
