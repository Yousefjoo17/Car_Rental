import 'package:carrental/constants.dart';
import 'package:carrental/core/methods/Custom_Box_Decoration.dart';
import 'package:carrental/core/widgets/customDropDownButton.dart';
import 'package:carrental/features/customer/presentation/views/widgets/customCarCard.dart';
import 'package:carrental/features/customer/presentation/views/widgets/selectionRow.dart';
import 'package:flutter/material.dart';

class CustomerHomeView extends StatefulWidget {
  const CustomerHomeView({Key? key}) : super(key: key);

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
          [kprimaryColor0, kprimaryColor1, kprimaryColor2],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
              const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "Pick up a car !",
                    style: TextStyle(
                        fontSize: 45, fontFamily: 'Caveat', color: Colors.red),
                  ),
                ),
              ),
              SelectionRow(
                dropDownval: citydropDownValue!,
                itemList: cityList,
                name: "city",
                onChanged: (p0) {
                  setState(() {
                    citydropDownValue = p0;
                  });
                },
              ),
              SelectionRow(
                dropDownval: modaldropDownValue!,
                itemList: modalList,
                name: "modal",
                onChanged: (p0) {
                  setState(() {
                    modaldropDownValue = p0;
                  });
                },
              ),
              SelectionRow(
                dropDownval: colordropDownValue!,
                itemList: colorList,
                name: "color",
                onChanged: (p0) {
                  setState(() {
                    colordropDownValue = p0;
                  });
                },
              ),
              SelectionRow(
                dropDownval: branddropDownValue!,
                itemList: brandList,
                name: "Brand",
                onChanged: (p0) {
                  setState(() {
                    branddropDownValue = p0;
                  });
                },
              ),
              SelectionRow(
                dropDownval: yeardropDownValue!,
                itemList: yearList,
                name: "year",
                onChanged: (p0) {
                  setState(() {
                    yeardropDownValue = p0;
                  });
                },
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 60,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return const CustomCarCard();
                }, childCount: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
