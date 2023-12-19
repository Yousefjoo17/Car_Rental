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
  String? citydropDownValue = 'all';
  List<String> cityList = ['all', 'cone', 'ctwo', 'tchree', 'fcour', 'cfive'];
  String? modaldropDownValue = 'all';
  List<String> modalList = ['all', 'mone', 'mtwo', 'mthree', 'mfour', 'mfive'];
  String? yeardropDownValue = 'all';
  List<String> yearList = ['all', 'yone', 'ytwo', 'ythree', 'yfour', 'yfive'];
  String? colordropDownValue = 'all';
  List<String> colorList = ['all', 'vone', 'vtwo', 'vthree', 'vfour', 'vfive'];
  String? branddropDownValue = 'all'; 
  List<String> brandList = ['all', 'bone', 'btwo', 'tbhree', 'fbour', 'bfive'];
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
                    value: citydropDownValue,
                    itemsList: cityList,
                    onChanged: (value) {
                      setState(() {
                        citydropDownValue = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "modal",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Spacer(),
                  CustomDropdown(
                    value: modaldropDownValue,
                    itemsList: modalList,
                    onChanged: (value) {
                      setState(() {
                        modaldropDownValue = value;
                      });
                    },
                  )
                ],
              ),
              Row(
                children: [
                  const Text(
                    "year",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Spacer(),
                  CustomDropdown(
                    value: yeardropDownValue,
                    itemsList: yearList,
                    onChanged: (value) {
                      setState(() {
                        yeardropDownValue = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "color",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Spacer(),
                  CustomDropdown(
                    value: colordropDownValue,
                    itemsList: colorList,
                    onChanged: (value) {
                      setState(() {
                        colordropDownValue = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Brand",
                    style: TextStyle(fontSize: 24),
                  ),
                  const Spacer(),
                  CustomDropdown(
                    value: branddropDownValue,
                    itemsList: brandList,
                    onChanged: (value) {
                      setState(() {
                        branddropDownValue = value;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
