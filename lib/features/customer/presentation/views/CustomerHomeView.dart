import 'package:carrental/constants.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/widgets/customDropDownButton.dart';
import 'package:flutter/material.dart';

class CustomerHomeView extends StatefulWidget {
  const CustomerHomeView({super.key});

  @override
  State<CustomerHomeView> createState() => _CustomerHomeViewState();
}

class _CustomerHomeViewState extends State<CustomerHomeView> {
  String? dropDownValue = 'one'; // Change the initial value to 'two'
  List<String> myList = ['one', 'two', 'three', 'four', 'five'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: customBoxDecoration(
            [kprimaryColor0, kprimaryColor1, kprimaryColor2]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "Welcome!!",
                  style: TextStyle(fontSize: 40),
                ),
              ),
              Row(
                children: [
                  const Text(
                    "city",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Spacer(),
                  CustomDropdown(
                    value: dropDownValue,
                    items: myList,
                    onChanged: (value) {
                      setState(() {
                        dropDownValue = value;
                      });
                      print('changed********');
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
